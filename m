Return-Path: <jailhouse-dev+bncBDJ7ZUWTT4DBBSUZ7XYAKGQEYWQ3M6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C2B13CB10
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jan 2020 18:32:59 +0100 (CET)
Received: by mail-lf1-x13c.google.com with SMTP id z3sf3381756lfq.22
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jan 2020 09:32:59 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579109579; cv=pass;
        d=google.com; s=arc-20160816;
        b=izIyQ5NedgYSXFELjYU9siuwKFaZCTvPXL5p3A8E2q2FHG1VpwonEY7UsI+l+ZLH3w
         QmjuuMOac7/+zFMKSvIPWkcfn9dtATCRjuXFg6QW/0TnqlKQnraavW/SDaBhSnsTRvOk
         fJl3V9+a2sceLCf1Ef+s54BIlDI4j3Gb2tJPshDBcVGiNCscq2KJoV/l2Fs1AO8cIYB6
         C/+6XIzZH6ZZp6/va5c0LEFtGOzbetNPWY/LtS/t3znPLU7Xz15ps0pFsxlqtIBTA44P
         nohsgMAoVy8AtTTL7TEuIg/eWgz8P4mXlmvo1gqwODgJZa7S95iYDAirUhg7hwTpB3mK
         XyGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=8EJjNhLsoy3NbAYI1v2MS//vGF5lFXwMOb2lWe38/ro=;
        b=iTLGFxKv+QPo28NgPGxRwJnFc87nVu2MOEZinmUz6EzQAhOES5+OX03oDxKJfCbD1q
         aEzNCD+k7jJy+qmFsiBiuxlVgOvYqCqxPM6EQALY+Xl43oZ/3ubG7qk3vO5Zuwt7Na8o
         l8Cdg6U5T8RUiU/2LcOl0+5yTA7m504dtgQMjp7BNDaQVYtjtGOx4K0zNp/Scf5n/Hfg
         HhPmYTBdEqv7M2o0ep0LvJTXuVk/QzI+AyhkPybwbKB5vkHOppFOkNxSF4jaKlGplFrW
         k4zSyb7PU6eXEjEEA3qD1Ukb3rH6BFCVEQrFbaPjelxcregnAv82jJ/X530ihQ2LWgf1
         wAtQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of chase.conklin@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=chase.conklin@arm.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8EJjNhLsoy3NbAYI1v2MS//vGF5lFXwMOb2lWe38/ro=;
        b=h6Yrim6iTOrG1RjMU9RLu19ChR8gIruJ5SNNb6AdR42GoCayAXhI621FDH9igY3arD
         VhG/iT6Ioj7ntJDcyyTpDqL62ScFOCTFFQ6u5kMX+qvLrJWXAe5u0SqmE/MtkIXtdq6k
         ahlO7TpJrOKXXF7Y8yq4ctzzr14MBNT/bjFDuFkq0nKgJHAU8PBGKFuCrQQDC517XEJN
         y5+QeUTjjVaiL6m1K+DmPj1yOVlpOd+HWTblIWSnnoOwLA2Dx9/IUI1oquxD8UrkQSd+
         PURfYw9/HADCc6HcvlsuJegAHC/O3uqvSMNKZM+iUgjM5MCW0NSq2b6g9npAHC3zUOF3
         9DEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=8EJjNhLsoy3NbAYI1v2MS//vGF5lFXwMOb2lWe38/ro=;
        b=ZyBCD5Ag2ZgrlkCAdvN5vrc4oKCBbzhwsjEw3a09h3iAvBIS1MMa+TvEpBrwk2cQ2p
         ARt21tIshi0uUK+vi8nkK0MW6TG7te72sHEFqGs7UbofCuJSjhyIXIpFSuY62KbnpyB8
         IyFgrY7df1faAH7SX4XSixHrESopNRfpOUy9tkCUyRDgjPBy8WSOH5E561auw6clgPB8
         PG8YFQRsS6dNu4tLQ4hKBot7WZW0lHdM9DOsCY0XUQHEDK/MKJYef3HZ/77GWp6y1ysr
         O0XP2TF7tMkwt5cyHZC9EIRo5lgogjCSf/4L4QGhSF2aWauCNLzrOwWfhLDZiM6MnODl
         4qtQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV7R1ccNmD50mpVASKeURh8bEskEk1iKRX4b2pLInc93W8LGBdF
	G6FkLgfMHvPb/6Qj2t5u9mI=
X-Google-Smtp-Source: APXvYqx1VDP9gT1UwDgcYWy54oh/iii1RoKMvsCwNLn67jbkZRyzuFLP4IPLj1DdANqChZhNsuLzIQ==
X-Received: by 2002:ac2:5287:: with SMTP id q7mr15341lfm.66.1579109579088;
        Wed, 15 Jan 2020 09:32:59 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1051:: with SMTP id x17ls2735914ljm.8.gmail; Wed,
 15 Jan 2020 09:32:58 -0800 (PST)
X-Received: by 2002:a2e:978c:: with SMTP id y12mr2482750lji.167.1579109577807;
        Wed, 15 Jan 2020 09:32:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579109577; cv=none;
        d=google.com; s=arc-20160816;
        b=vUz3/A++XxXxT3MMPSwdmJX24VOiLgvwTSwCnmRHpGVHtmajoxIfhBJrjFnQY0kXl/
         1cGPPH2WEcNV93isZlthF8y/D4gD1PtzA+3rFjILFEGHdspMtHq9KLY8Rd2cVZtyyUN+
         uOjaeUAj7fzB0UGF7jKiiln6MSEv3zEm+F6wWPnBEPrglJUiRBmueUEuRi9XpgtAEnFx
         dXyNo7vFGjo12G3S04t6IrXgu53c+Ki968BrRDPsO9dDSQXEVInpiFEGhUKqzBHh330H
         IejO69SxGyxduO/q13VUXzJS5jITShbSantMy3cYrAS1jwiTGV+u2Ob4bXViB80RNvTa
         doxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=Co6sJ1ZgwllK9a7lCdF1j6yy8OJ1g8wQzFXODGbWY7Q=;
        b=Wrmqu7YuGR8zuGZGDMUR9G8MnmANIb2DCeQByyh/UfOEa1Tov0x9r6rg0/6RHHn/rw
         XvJOZU26IXQVcJ0vqe0i6FlsC5wLtzOeZ4lqIexdPDeaEnFS8UQPRDa3j5slIx9HVtIk
         wHgx326vxWwtKHizRsXFWRMRGPv/UDaErAoUOUqNX9nTTnZ9nstGY1blIjxBzU5NEXsh
         BxGxZoqqR1M3uuHU0AjDCTXCF06QpfPqJyr1ETKVXEdRnYMGYbHTYYMQqf9MJLtjX5/p
         BoLk+QWTCMCT0IRXU3e1sXiVzOigVbh8aVlyMgHhnrR9J5jw1QaA7sHRZ04zfTUtOM+y
         FoDQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of chase.conklin@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=chase.conklin@arm.com
Received: from foss.arm.com (foss.arm.com. [217.140.110.172])
        by gmr-mx.google.com with ESMTP id o24si883274lji.4.2020.01.15.09.32.57
        for <jailhouse-dev@googlegroups.com>;
        Wed, 15 Jan 2020 09:32:57 -0800 (PST)
Received-SPF: pass (google.com: domain of chase.conklin@arm.com designates 217.140.110.172 as permitted sender) client-ip=217.140.110.172;
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F0E3328;
	Wed, 15 Jan 2020 09:32:56 -0800 (PST)
Received: from C02TM06ZHF1T.austin.arm.com (C02TM06ZHF1T.austin.arm.com [10.118.111.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C4993F6C4;
	Wed, 15 Jan 2020 09:32:56 -0800 (PST)
From: Chase Conklin <chase.conklin@arm.com>
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@web.de,
	Chase Conklin <chase.conklin@arm.com>
Subject: [PATCH] core: fix hugepage splitting in paging_destroy
Date: Wed, 15 Jan 2020 11:32:17 -0600
Message-Id: <20200115173217.3256-1-chase.conklin@arm.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Original-Sender: chase.conklin@arm.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of chase.conklin@arm.com designates 217.140.110.172 as
 permitted sender) smtp.mailfrom=chase.conklin@arm.com
Content-Type: text/plain; charset="UTF-8"
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

When unmapping pages, it is not sufficient to compare the size of the
page to the size of the region to be unmapped to know whether a
hugepage needs to be split. That approach does not split hugepages
when the region to be unmapped is larger than a hugepage but does not
cover the entire hugepage, resulting in areas outside the region to be
unmapped and leaving areas inside the region mapped.

Instead of comparing the size of the region to the size of the page,
check if the region overlaps only part of the page and split the
hugepage if it does.

Fixes: 1f7784032531 ("core: Add support for creating page tables with hugepages")
Signed-off-by: Chase Conklin <chase.conklin@arm.com>
---
 hypervisor/paging.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/hypervisor/paging.c b/hypervisor/paging.c
index 4a24c1f6..83cdcf00 100644
--- a/hypervisor/paging.c
+++ b/hypervisor/paging.c
@@ -389,7 +389,20 @@ int paging_destroy(const struct paging_structures *pg_structs,
 			if (!paging->entry_valid(pte, PAGE_PRESENT_FLAGS))
 				break;
 			if (paging->get_phys(pte, virt) != INVALID_PHYS_ADDR) {
-				if (paging->page_size <= size)
+				unsigned long page_start, page_end, region_end;
+				/*
+				 * If the region to be unmapped doesn't fully
+				 * cover the hugepage, the hugepage will need to
+				 * be split.
+				 */
+				page_size = paging->page_size ?
+					paging->page_size : PAGE_SIZE;
+				page_start = virt & ~(page_size-1);
+				page_end = page_start + page_size;
+				region_end = virt + size;
+
+				if (virt <= page_start &&
+				    region_end >= page_end)
 					break;
 
 				err = split_hugepage(pg_structs->hv_paging,
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200115173217.3256-1-chase.conklin%40arm.com.
