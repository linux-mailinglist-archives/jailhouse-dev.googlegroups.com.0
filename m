Return-Path: <jailhouse-dev+bncBDJ7ZUWTT4DBBA5KRSBQMGQEBTNMHOA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23c.google.com (mail-oi1-x23c.google.com [IPv6:2607:f8b0:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id D32CB34E726
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Mar 2021 14:09:40 +0200 (CEST)
Received: by mail-oi1-x23c.google.com with SMTP id b1sf6557838oib.15
        for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Mar 2021 05:09:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1617106179; cv=pass;
        d=google.com; s=arc-20160816;
        b=rNRSs8oIHgW8DHnDEYRFXh2RlhL8iaiD8gp2SZHgFlGzhQLt/n9ZxtjFn/DQZBGCmZ
         2z5HwDtF3gX9lJ1QjmC9X/yohCzZAgUWEOuk9qSLc8STPneSWhXN9JEnNiIRADX/Q/qZ
         zUB8pbeFylqhozxolFZHzdPtXI+Y8WVM5V+7FXr+nQCkkLkV64uP2hKM8FxyzlKaYYUU
         MsD6VqRA97uXRIHkQCPogHNxPNBFcQL9Zn0HoAHZf6ivHK9aLksTGD5xww3xkVxe44A6
         6NI85eYjFEtp6ILOmGm2Wu4qsxVT968xRQN95lFbno3jLkxnsqXvnh/hW/TfPc/t2GAf
         y8DQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=7VsHicXNwIUmFt3w8BkDhAAklDy+dScJEEwBf22JkDE=;
        b=jdjM1gdGgUKwMsbM1FMHCEa4RMvsCv/B6sr7FiJkY00NyXXMUI6MLLDg3dLCfhpPYS
         cgr26yDHEd0A9HcAOqskcY1fIab339xrIIUtgFTVS6nojW1uFC/bOQ3xE/8eva7hivNr
         srKXbrZ3AIPV56p/NTwgPud3sUBi282arCnqZK98puMXaMHgRgVOYCYE9SMQaKSu3VuT
         LHrsnT8BQ5Pb6mUhkAPKXSvV73ciPwFqerwPGDJgD1egj2wNwJ5n21mpROMpVOvD58G4
         FqXskexlyGwiwFyXQYwfJeuM4kmshLUKb5goVvoZYUhEd41rO3kgu7TPnfIqamVSJDhP
         YI3A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of chase.conklin@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=chase.conklin@arm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=arm.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7VsHicXNwIUmFt3w8BkDhAAklDy+dScJEEwBf22JkDE=;
        b=kTKs2yIBY/IZx/6UkeeM13s+8rK68qAGtr+ZNSjFCQR/mRSsojSzY3Say7kCNftrib
         s9j2+gdyEEJBsIzaByTk/JtePj25P90vaSCGlOZCMAcJaJC0HNW/pr+gLkdNh3boUgZE
         MDPB56kLqXgJcdDKUmw902oDa701po0jiSxGs042ooMRckhY5yiU9CLD2sjsNtsWy9Kd
         4EDryFJeCrI7Fx6t73Pn9jF7WsqOh/2jQ/lxXkyrfZoK8tVFnYa+JhF9HQfdc3MvucWp
         7Xxktcvx+Sffm6LVTJSRt+0O+lgmbAZLne8SbWllNCN4M9mgB4FX7BcaqWHqibZfd2Xp
         pyOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7VsHicXNwIUmFt3w8BkDhAAklDy+dScJEEwBf22JkDE=;
        b=i2A5bh4JnKnEjDvgN49pWN8BgRDfNxhNe5jMuhRehTf2xLwTmefx28G/chnM7L4YK1
         WcoDZ893n8RKoWuBDejbE+3P29hm0mdaESMa2R4JcgshG1wawcw2BnfS6QDE4r8fij4I
         BsFWzg23arEDprucjH72ZovbUnb/o1HZv+p/ey5PHisxch2hmWlmXKD4DaCPcW6LDFq0
         0XWNQPviFyVOBpVhRnx6leUKcM8Ncpp9AdtL/BgcXTIU/ZVkxi3JEK81Ns2QqF3TRz1S
         yGp4UV8HuwABYqIA2QhoB9AccMB4oKHltJOBVDTkqsb1YbU9U0ULOpIrtwwfTJrI0XF6
         uyyg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531JejmUodeV/igaz9Yjp8j/IGVkMnxIj7s3XQlLpE1klw4OqD7S
	3LL5gJyiCgwVMqVVaCC2P90=
X-Google-Smtp-Source: ABdhPJxNPc6y12W/PmYlzKXuvjSYYgoSaqAmliyz4NAlm4/tLA1ZIK0BX+Fe9wn8fsyV7Omy/iB2gw==
X-Received: by 2002:aca:d941:: with SMTP id q62mr3017170oig.119.1617106179299;
        Tue, 30 Mar 2021 05:09:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:6a47:: with SMTP id h7ls4824957otn.9.gmail; Tue, 30 Mar
 2021 05:09:38 -0700 (PDT)
X-Received: by 2002:a05:6830:3497:: with SMTP id c23mr26026703otu.344.1617106178877;
        Tue, 30 Mar 2021 05:09:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617106178; cv=none;
        d=google.com; s=arc-20160816;
        b=lO9mq2mm6dLoUkRODqQHvX9uX0IoPdqeQsJ6c2xXoTI5fcuOETqTwX9H2kYi7mF8Xn
         7HC2Owkfh8ebNr47Ja4dQWQIivrplYWkwQEIQ049OTKLbnuB0SyO/OsxG9sNq4KyYJao
         aKcbVfZo/hKzffSVHIfxl+rB04FmrrAvXnLr1VDNwS+lWXg83L00u9lyNxoaTjQESl2A
         zDwSd4Bry6rBYAF47nr4tS9EA8RKNWC27XwYjzLobEw5VJLQTym1/fuq3RJmzrSG8FVw
         MnVWuoxFaQ3MRj27lcQy86X2QtXrdRAGZ9PxGqHyhLB2bN7fffHBR1eBTXU8XzrYb72g
         6l6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=yMr9+WK2w5gOp5tpbD2nIeLnJbKgfut5hS/Al8PgsTg=;
        b=mVrPL0qGmf30+caMs/ewz11pzA20J18zgWHsBCUIK2R32UzD+XU38oEPrkcTttVDpH
         aZv89cqeVVzMtRdCV/OkZYP9oE2zXEP8I1Yja5nI0pxYM7cNDwUCM6YBAK2Y+9cJc1rs
         efJKp6ge1HZV1GyepTn7JLhLqx/30bDRdZbDntr/5mm17rdmnBlZb6XslCT1/wnYR+PX
         iqf3VdqGHD2a7tAUlKhLUR0XVCwdwWwtamxeNGtrhPBNc7QfgZkexSVaCB8iPMFkBXO6
         A1rxNZbN4YN0eUIRAG0iTU4aRYuhCm7SdhN4NU96Mfi5E3bQ05liDFnGELE3cjPuw/v5
         UKow==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of chase.conklin@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=chase.conklin@arm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=arm.com
Received: from foss.arm.com (foss.arm.com. [217.140.110.172])
        by gmr-mx.google.com with ESMTP id w4si981488oiv.4.2021.03.30.05.09.38
        for <jailhouse-dev@googlegroups.com>;
        Tue, 30 Mar 2021 05:09:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of chase.conklin@arm.com designates 217.140.110.172 as permitted sender) client-ip=217.140.110.172;
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C1C731B;
	Tue, 30 Mar 2021 05:09:38 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.119.35.120])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 66D363F694;
	Tue, 30 Mar 2021 05:09:38 -0700 (PDT)
From: Chase Conklin <chase.conklin@arm.com>
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@siemens.com,
	Chase Conklin <chase.conklin@arm.com>
Subject: [PATCH] core: avoid overflow in paging_destroy
Date: Tue, 30 Mar 2021 07:06:32 -0500
Message-Id: <20210330120632.23496-1-chase.conklin@arm.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Original-Sender: chase.conklin@arm.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of chase.conklin@arm.com designates 217.140.110.172 as
 permitted sender) smtp.mailfrom=chase.conklin@arm.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=arm.com
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

It is possible for the ending address in paging_destroy to overflow to
exactly 0. For example, in a build with 32-bit addresses, a request to
unmap 512MB at 0xe0000000 will result in an overflow (0xe0000000 +
0x20000000 = 0x100000000 which exceeds 32 bits).

This overflow can be avoided by comparing the last address in the
region to be unmapped rather than the first address to not be
unmapped.

Fixes: 7cffb9b7d54d ("core: fix hugepage splitting in paging_destroy")
Signed-off-by: Chase Conklin <chase.conklin@arm.com>
---
 hypervisor/paging.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/hypervisor/paging.c b/hypervisor/paging.c
index 75d5da59..e77fac30 100644
--- a/hypervisor/paging.c
+++ b/hypervisor/paging.c
@@ -399,8 +399,21 @@ int paging_destroy(const struct paging_structures *pg_structs,
 					paging->page_size : PAGE_SIZE;
 				page_start = virt & ~(page_size-1);
 
+				/*
+				 * It's possible that virt + size overflows to
+				 * exactly 0 (e.g. a 512MB region starting at
+				 * 0xe0000000 with 32-bit addresses) during
+				 * normal execution. Any overflow beyond that is
+				 * a programming error.
+				 *
+				 * To handle this case, subtract 1 from the size
+				 * when comparing both sides. Note that
+				 * page_size is always > 0, so there's no risk
+				 * of underflow.
+				 */
 				if (virt <= page_start &&
-				    virt + size >= page_start + page_size)
+				    virt + (size - 1) >=
+				    page_start + (page_size - 1))
 					break;
 
 				err = split_hugepage(pg_structs->hv_paging,
-- 
2.16.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210330120632.23496-1-chase.conklin%40arm.com.
