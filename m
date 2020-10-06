Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOPG575QKGQEKYI7JFY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 617562844E8
	for <lists+jailhouse-dev@lfdr.de>; Tue,  6 Oct 2020 06:31:54 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id b12sf5568647edw.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Oct 2020 21:31:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601958714; cv=pass;
        d=google.com; s=arc-20160816;
        b=Go0o5zkdEHkV9+P8WcqduU70a1vYVzAQEVZDTOQQlReDDtrwOLOuHUtZTV3DOTz/2l
         zWKzC9QqESra+z+HuKiYPLAHq48IQxWsLSpzeI9/CTnkd7ERbATggr3ZNMW4j0G8uFmm
         THndm20KUqGk8g8GesLs1wNjTBb2fwSb7O/5WStVTX0iopgZAzVd20TGXOvavwg0ul9J
         MjYO1zyfIiC+ytLK2M9VgYZAMk4+LKHae20IekmZi2LvH97kHdaqB9dP1Q14bv7GHuc5
         29AXpg8aad8BMg5ikHgrbLQkeBTocRsEHDFE1AtRbURNMNqYZI5ve05hVkr34sfIz5aO
         JdFQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=aoW2PW/nr+EBCIigT45FCMvPptA4SwC3043L6UjD0/g=;
        b=fuMm+ndTeLMIQ8eSAx5yYsMF0iQ/V96eAhq6ZM+q70DI2q9rn+9wjnieS5bhuE8KsD
         A/8WXF/oPbPMXmkmkg3/aDHI4/sj0I1oLB0Y7ArmiUWaRKAc0+zm0tEE5/w82CSQV9a0
         /5OqjqDUKXugkBhXpmbEM37ZVJceB814OZAMQAKkjYrv++dHLjCo0D3GHfmash6tmQ6r
         ol+gfOkZt8amIMZdBouP3lNF1TTH84QinbdF1c1FHjdgWEOxzbg1KYEtTstlSB93Thdc
         DxgBH9T5IYugJvun4TGx2klL1Srzp2NBkVPE0880VsMEn3ltwYFkFRS4/cHkD2dIiGd8
         02pQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aoW2PW/nr+EBCIigT45FCMvPptA4SwC3043L6UjD0/g=;
        b=aQK+Oe7RQn7wzdZTqAcXP//8LbizW2sAAFxUuOqBXlkUcZ4I5gH8Iwb+ZaYkBdyA/8
         Yb0NGipFnhkNMmI++u3Bsk1qG4lRQgQd/jyZJyqfSJR7J1fpkjFWcan5Mcgel++Ik6jG
         Ud8U8TI0xO2zmOk2cg/QhKqnaFwTtnObsKxj/03OEKaCM5G8DNq5vBGaxhkS0mLqG2hT
         VB2rnCxm48hO8yoooHddFG7jYNMBdQRIObwGIXJtHRjJ1DYOlv4JNlij87JqznoWGRNW
         CjvDUGzhomiUbqQFT2on/SL0Qp9nohQga58MxzIIIIh6fUI4BqjuR9zUzswRGxX0aFAM
         BFfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aoW2PW/nr+EBCIigT45FCMvPptA4SwC3043L6UjD0/g=;
        b=CbzJgUu/nIW3h8Df3CWm+D7jyOOf1dNW8bYtKKNHk9AhpaX7QDT+l2sL/6eSqTfBTK
         zbbW7n+0ibfyPbEODP5AOBo9n9gjXP47ZUu3MVDRIc7Vo4JM203Rzzo7phwTML+xwn4G
         af3QmlymhyW3+zuoSVkmpXxz40uHDqe/zpXalv61CsEZybRhjax1gcO9a10H0G4vIoHh
         iBOlUjVTMvU6THWB+8pGkWITyGyqZXWhzewlXRVpFq8mlOpdSPV8WpKTnj27HJ1Xefyo
         Jo04vt1C3mYYVyWjgDivVdZVSHrX2uUI6kmy0hlviS7LVhlEkELF8mIwT5OS5MRBfW2F
         jPRw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Wnqu7sGOXnouNxVzH7E2iUK/TmZkk1qfOqT5ZStW3Pef9L76j
	28fogi0ejwPlsfiqqdstPlY=
X-Google-Smtp-Source: ABdhPJxAlcdS0+aololpfixk6kYzup4A92471ma0/aiizAqhPEC88TDOmm4ftTxGQj0xg1cl09iE7w==
X-Received: by 2002:a17:906:4306:: with SMTP id j6mr3245231ejm.523.1601958714100;
        Mon, 05 Oct 2020 21:31:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c545:: with SMTP id s5ls7737737edr.3.gmail; Mon, 05 Oct
 2020 21:31:53 -0700 (PDT)
X-Received: by 2002:aa7:c545:: with SMTP id s5mr3379289edr.10.1601958713131;
        Mon, 05 Oct 2020 21:31:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601958713; cv=none;
        d=google.com; s=arc-20160816;
        b=AGb4l0dZNI7l3jE633TWKctWJkHB1JcDPMpXCzyeUVwKOxdFd34pKeArjYcLRu6SfG
         j1qNPCX40EV89YKQeb6rsORo3DjfnPuKmxfD1MTuGGywadNAU+dFlWVYN4Fkq97CFLFQ
         MY//U8nbqH8sWb0nedFM3+HNdpdE5cZ0yPrWnWTCMBlquVooBHKxgHkQLuAPo7S2wdHX
         AIu47rEw/NFYud3QCEaBqsJUWeMDaPCBqIkuYz0ZZT3GIhTyGpk0qVBK8M8nh6jbANje
         F783TGuRW09YEQR8KEnm2nf4RrcVSc6ywi5KB0wokJDYkxwyb6ws5Xb0ggcxQxQk4SlF
         CRzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=oKxHEAz6TFQ2igg3EftrIqeIeSpiKlcNB/jI7DIz1Vo=;
        b=fONcL2cht6S4uU4PJKfw9to+Jb0tcK8wFnF4c61OOgCteaHsnPjOnWC00PIla8PKDk
         VK7n6fk02NweR+LkFi8dpmq9x9QNauTWqGTIKeMQaFHYPbjq7tCMmUbV/d5xgRHa4Lwi
         0ZUzwDkJek6+USmEnQUD9ZAbffJkhXE/3Agv7ShcgjdOMcjnM4CLFW5l3ov2pEuxGPZT
         N4VMvviraa1ThGD8P8WtGMzm7DHhRG7acmKfCn7toNwVggePljLAZk79MwSyIZCMTPjH
         HMiXa5+Kw9QCFzvkoYgJl/3Wj7JXBe7YFMM+6xv/8jwj0lYNSKHP0lQuixOs3TR7rk88
         9gTA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id g90si75238edd.1.2020.10.05.21.31.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 21:31:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 0964VqS4020262
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 6 Oct 2020 06:31:52 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.160.159])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0964VY7v008537
	for <jailhouse-dev@googlegroups.com>; Tue, 6 Oct 2020 06:31:51 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 11/19] ultra96: Add rootwait kernel parameter
Date: Tue,  6 Oct 2020 06:31:26 +0200
Message-Id: <223a94be3f018c46ad5bc53790b737f2b94c36d7.1601958694.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601958694.git.jan.kiszka@siemens.com>
References: <cover.1601958694.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Wasn't needed so far, but better safe than sorry.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 wic/ultra96.wks | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/wic/ultra96.wks b/wic/ultra96.wks
index 2ce1785..41d092e 100644
--- a/wic/ultra96.wks
+++ b/wic/ultra96.wks
@@ -13,4 +13,4 @@ part --source bootimg-partition --ondisk mmcblk0 --fstype vfat --label boot --al
 
 part / --source rootfs-u-boot --ondisk mmcblk0 --fstype ext4 --label platform --align 1024 --active --sourceparams "no_initrd=yes"
 
-bootloader --append "mem=1820M"
+bootloader --append "rootwait mem=1820M"
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/223a94be3f018c46ad5bc53790b737f2b94c36d7.1601958694.git.jan.kiszka%40siemens.com.
