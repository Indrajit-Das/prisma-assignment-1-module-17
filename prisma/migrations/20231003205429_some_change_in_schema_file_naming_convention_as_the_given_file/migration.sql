/*
  Warnings:

  - You are about to drop the column `userId` on the `categories` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `customers` table. All the data in the column will be lost.
  - You are about to drop the column `invoiceId` on the `invoice_products` table. All the data in the column will be lost.
  - You are about to drop the column `productId` on the `invoice_products` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `invoice_products` table. All the data in the column will be lost.
  - You are about to drop the column `customerId` on the `invoices` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `invoices` table. All the data in the column will be lost.
  - You are about to drop the column `categoryId` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `imgUrl` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `products` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[user_id]` on the table `categories` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[user_id]` on the table `customers` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[invoice_id]` on the table `invoice_products` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[product_id]` on the table `invoice_products` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[user_id]` on the table `invoice_products` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[user_id]` on the table `invoices` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[customer_id]` on the table `invoices` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[user_id]` on the table `products` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[category_id]` on the table `products` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `user_id` to the `categories` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_id` to the `customers` table without a default value. This is not possible if the table is not empty.
  - Added the required column `invoice_id` to the `invoice_products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `product_id` to the `invoice_products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_id` to the `invoice_products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `customer_id` to the `invoices` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_id` to the `invoices` table without a default value. This is not possible if the table is not empty.
  - Added the required column `category_id` to the `products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `img_url` to the `products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_id` to the `products` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `categories` DROP FOREIGN KEY `categories_userId_fkey`;

-- DropForeignKey
ALTER TABLE `customers` DROP FOREIGN KEY `customers_userId_fkey`;

-- DropForeignKey
ALTER TABLE `invoice_products` DROP FOREIGN KEY `invoice_products_invoiceId_fkey`;

-- DropForeignKey
ALTER TABLE `invoice_products` DROP FOREIGN KEY `invoice_products_productId_fkey`;

-- DropForeignKey
ALTER TABLE `invoice_products` DROP FOREIGN KEY `invoice_products_userId_fkey`;

-- DropForeignKey
ALTER TABLE `invoices` DROP FOREIGN KEY `invoices_customerId_fkey`;

-- DropForeignKey
ALTER TABLE `invoices` DROP FOREIGN KEY `invoices_userId_fkey`;

-- DropForeignKey
ALTER TABLE `products` DROP FOREIGN KEY `products_categoryId_fkey`;

-- DropForeignKey
ALTER TABLE `products` DROP FOREIGN KEY `products_userId_fkey`;

-- AlterTable
ALTER TABLE `categories` DROP COLUMN `userId`,
    ADD COLUMN `user_id` BIGINT NOT NULL;

-- AlterTable
ALTER TABLE `customers` DROP COLUMN `userId`,
    ADD COLUMN `user_id` BIGINT NOT NULL;

-- AlterTable
ALTER TABLE `invoice_products` DROP COLUMN `invoiceId`,
    DROP COLUMN `productId`,
    DROP COLUMN `userId`,
    ADD COLUMN `invoice_id` BIGINT NOT NULL,
    ADD COLUMN `product_id` BIGINT NOT NULL,
    ADD COLUMN `user_id` BIGINT NOT NULL;

-- AlterTable
ALTER TABLE `invoices` DROP COLUMN `customerId`,
    DROP COLUMN `userId`,
    ADD COLUMN `customer_id` BIGINT NOT NULL,
    ADD COLUMN `user_id` BIGINT NOT NULL;

-- AlterTable
ALTER TABLE `products` DROP COLUMN `categoryId`,
    DROP COLUMN `imgUrl`,
    DROP COLUMN `userId`,
    ADD COLUMN `category_id` BIGINT NOT NULL,
    ADD COLUMN `img_url` VARCHAR(191) NOT NULL,
    ADD COLUMN `user_id` BIGINT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `categories_user_id_key` ON `categories`(`user_id`);

-- CreateIndex
CREATE UNIQUE INDEX `customers_user_id_key` ON `customers`(`user_id`);

-- CreateIndex
CREATE UNIQUE INDEX `invoice_products_invoice_id_key` ON `invoice_products`(`invoice_id`);

-- CreateIndex
CREATE UNIQUE INDEX `invoice_products_product_id_key` ON `invoice_products`(`product_id`);

-- CreateIndex
CREATE UNIQUE INDEX `invoice_products_user_id_key` ON `invoice_products`(`user_id`);

-- CreateIndex
CREATE UNIQUE INDEX `invoices_user_id_key` ON `invoices`(`user_id`);

-- CreateIndex
CREATE UNIQUE INDEX `invoices_customer_id_key` ON `invoices`(`customer_id`);

-- CreateIndex
CREATE UNIQUE INDEX `products_user_id_key` ON `products`(`user_id`);

-- CreateIndex
CREATE UNIQUE INDEX `products_category_id_key` ON `products`(`category_id`);

-- AddForeignKey
ALTER TABLE `customers` ADD CONSTRAINT `customers_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `categories` ADD CONSTRAINT `categories_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `products` ADD CONSTRAINT `products_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `products` ADD CONSTRAINT `products_category_id_fkey` FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `invoices` ADD CONSTRAINT `invoices_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `invoices` ADD CONSTRAINT `invoices_customer_id_fkey` FOREIGN KEY (`customer_id`) REFERENCES `customers`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `invoice_products` ADD CONSTRAINT `invoice_products_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `invoice_products` ADD CONSTRAINT `invoice_products_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `invoice_products` ADD CONSTRAINT `invoice_products_invoice_id_fkey` FOREIGN KEY (`invoice_id`) REFERENCES `invoices`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
