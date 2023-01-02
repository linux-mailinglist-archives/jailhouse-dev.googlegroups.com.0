Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCUHZKOQMGQEALWZAVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 2447565AD97
	for <lists+jailhouse-dev@lfdr.de>; Mon,  2 Jan 2023 08:11:07 +0100 (CET)
Received: by mail-ed1-x540.google.com with SMTP id t17-20020a056402525100b00478b85eecedsf17568203edd.18
        for <lists+jailhouse-dev@lfdr.de>; Sun, 01 Jan 2023 23:11:07 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1672643466; cv=pass;
        d=google.com; s=arc-20160816;
        b=HjtP8Z3N8quJcgPTEHH9SNvs/u02sdNOjonMqGVV48hEcQsgnXctWMOg84b7d6rrMb
         FsaVE4zGbj7f89JKvt30oafvvDFr3avy9M/a61sp4fzLS8SFftBKmT81NamsjtRTa/4p
         YCAGaK9ebWntM6PfVcFtTlaJE9pqRDeX36tp8ZIbLVfYUAsGRvtIsdp5ZXzTw/2pZebL
         SSeZQxoTgCvPnhOXoW2WTGDfBCqnNRU85P1YKpbYGQp2pQfBdlfy0GgrZ0lbJbXvYzl6
         4soUAi5bS/T30148v8NhhON8J9Jb33fnYF7/TM5F5LSIskLhpUc2u7JeOnwy180UNCvk
         Bx4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:feedback-id:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:sender:dkim-signature;
        bh=PKEWHRM82LVt80gsd3WNuoQhy8KiQNTZqcxfs6ihtUU=;
        b=B3Ms+9Gj72fmFplubLVAn885SZ+K2eHnWgDBr57XGY2zXipFucAxTBKn5UDKirtG/f
         MbwkSH12caiwZqS7wdstaw3jnZR1Ky1Hh+FXL6RDQPllEk2OxPalJJ1rnVsybcnPzjN/
         zZ0GaexNlgfnIWCPvhGbUIAKn4VLo+N+3QsvRspmdCX3hRQeiosL4amajxqWSMv0/AGT
         X3uKlbB94vFIsARPxfP+p3cCtgnQVcP/XE2gUR/c4jkYjLUO1AzFOrzfGgNGuKCRrrjg
         PAvaiLEG7H8x4htmSX2L5FvwZ/uy9EDB/2z+ThgQ5TqNxFAJV48TnjoBYwvNRCb0zRzn
         QvTQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=mRLVZe9T;
       spf=pass (google.com: domain of fm-294854-2023010207110465a854063913cecbb6-_qgvq0@rts-flowmailer.siemens.com designates 185.136.64.228 as permitted sender) smtp.mailfrom=fm-294854-2023010207110465a854063913cecbb6-_qGVq0@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:feedback-id:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKEWHRM82LVt80gsd3WNuoQhy8KiQNTZqcxfs6ihtUU=;
        b=rD4OLc2R8VB96XUdsM++c59Na6erJGw7qYgwpHPAnzDs+VkpIauL+1/a+pa7IO53J/
         Hg9bilKMuFUL9ba+xEigUpHn7JQ0sVtQGHFDJpqHE9VQ2YZ+Dok3gxZaNfs1AVruNGSq
         2Qx3JYnXiCn5K5RL5Em7ixI34TgHDfp7MQ9G8VR7antwvqJA/kFGfVRhw7f4fxWysR+z
         FYgn+je5lfj9T7Dfc2YqIw0zFdgntIn89fMppDpFu2hEVWvX9BV0ECq/ifzFA7LPw3xH
         7JYtr6RSrIFMydzjhuKYIPt6todTOLoScinxYVgbM5sotUS2cD+DxzwfJGDmBQaIc+Pf
         W+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:feedback-id
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PKEWHRM82LVt80gsd3WNuoQhy8KiQNTZqcxfs6ihtUU=;
        b=h0qkYP+tDXyi2CsVCYFaHyRCfZjw/rSHt0Jjlhrxb4nDrxevlKKVaeF2uLHS/KbVvx
         J260jBJq/Vi4JpaNwLRTrBWFnUjQceJKZ1aOpC3qcR0Pe5zMQYKzi7+mQ+slWogCa5nD
         zqEFKebO+2pTOMjOE7rsvL4klCTNOAyMY6SDqwJa8C0mcQx5Oyffq7fMRJBFB1csq4t0
         ozEkyfKVWz2pCzv757gDbMn6lTdHnEHpXg7wqaHcX5xBUYKQ58Zu3QhJLAEI1sLyZKgF
         39XA/AY1bTCPiJ+xaUCaT6kLD7hjVk3XfGRlbyPOfxh5yx9eQmsTCCztqvlzxUYwr0l9
         OuLQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2krxwZAcfsfz5+YZWEAvfyIkqSRvr8OvSr80Ok034m9gLQqHpOYc
	tFhw05cvztnX1PPgz9YYPI0=
X-Google-Smtp-Source: AMrXdXsgnAp7y6jA40jweZRJDBNdx4xz218f6IRP95ESvAi/AqyX4cCIQ9xyq27qhvdJ/71+ADlozA==
X-Received: by 2002:aa7:c58b:0:b0:487:21e1:b63b with SMTP id g11-20020aa7c58b000000b0048721e1b63bmr1783361edq.125.1672643466566;
        Sun, 01 Jan 2023 23:11:06 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:b24d:b0:7c1:6e9c:4a2c with SMTP id
 ce13-20020a170906b24d00b007c16e9c4a2cls2576729ejb.1.-pod-prod-gmail; Sun, 01
 Jan 2023 23:11:05 -0800 (PST)
X-Received: by 2002:a17:906:684b:b0:7c1:2fc2:6740 with SMTP id a11-20020a170906684b00b007c12fc26740mr34856160ejs.46.1672643465029;
        Sun, 01 Jan 2023 23:11:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672643465; cv=none;
        d=google.com; s=arc-20160816;
        b=bWqJTvkaG7alkCTPd1OHV1zAwDuQ6hN1KGmOj5RXPKH/bdiP2M5dFmNQcCPSr9RTIU
         oG4Za8Wp3GzlNIiOCnHNrVGmlfB11SNCrocLaw3NHiydHPDoVV7N6dALNyl8ViIdFS3L
         BWkX42GQVjsP83FIvGIQ053WwjGXLqAfIOWmNXlxtcgGt9tg31KSw5VM03l3GaivpwGo
         SGzwB38aPrkKgcjmctwM4DOtTlguldAyh5xg+/oUXVKfBc18W02flgWkCR+uj9UoiJjQ
         2vENqYL5TZ6oGLqlcLebb7BpBT35lmO4ocfroOuMwDwC+BCkpZyEwpOGqyyhwZPlWSv4
         l2BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=feedback-id:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=93HzXnPrHvKmFAMvVKupJMOpDzq/YYCr8Z2GyzWUVK8=;
        b=kjzGGINlzRWNfUSUiO9+BMcbTobGUnlY5YXpZwQKaxy/i5kB/30HsvtMrccqE/tWT+
         sd5ikXWM6BB5jVAfWGbFOwHDiqjri5facI0HHp+gAgCGVmpn1zoL6NoN0bUCi5fGsLVq
         OyYZYnCqU/Tnhbl7rMqDpmUZxs/LgJxDE8vX1wJnKC+W0f2KEz2ClfA2Vvv0bkUVxWE5
         ymh5Q8vOnQhBxTI+k/rMNYp07zEkNFcLYAazMoX2t81LlKtXS2MMoDu51RVceOAecnZ0
         orjSD3xWSyFuFn65k40iR4NUQB+SKEDXibvtiAmjz4qdJ+yrKpP8XHP0ZzXKsGDWzL2a
         nktA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=mRLVZe9T;
       spf=pass (google.com: domain of fm-294854-2023010207110465a854063913cecbb6-_qgvq0@rts-flowmailer.siemens.com designates 185.136.64.228 as permitted sender) smtp.mailfrom=fm-294854-2023010207110465a854063913cecbb6-_qGVq0@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net. [185.136.64.228])
        by gmr-mx.google.com with ESMTPS id x15-20020aa7dacf000000b0046920d68fe2si995826eds.4.2023.01.01.23.11.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Jan 2023 23:11:05 -0800 (PST)
Received-SPF: pass (google.com: domain of fm-294854-2023010207110465a854063913cecbb6-_qgvq0@rts-flowmailer.siemens.com designates 185.136.64.228 as permitted sender) client-ip=185.136.64.228;
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2023010207110465a854063913cecbb6
        for <jailhouse-dev@googlegroups.com>;
        Mon, 02 Jan 2023 08:11:04 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 2/4] x86: vtd: Drop source-id validation while parsing root cell IRTE
Date: Mon,  2 Jan 2023 08:11:01 +0100
Message-Id: <f70e366bb77de3ceb59464a943cc5430e69ed7f4.1672643463.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1672643463.git.jan.kiszka@siemens.com>
References: <cover.1672643463.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-294854:519-21489:flowmailer
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=fm1 header.b=mRLVZe9T;       spf=pass
 (google.com: domain of fm-294854-2023010207110465a854063913cecbb6-_qgvq0@rts-flowmailer.siemens.com
 designates 185.136.64.228 as permitted sender) smtp.mailfrom=fm-294854-2023010207110465a854063913cecbb6-_qGVq0@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

This was not complete, rather assumed SVT to be 01b and completely
ignored SQ. The SID test failed when the root cell chose SVT to be 10b
to describe a source behind a PCIe-PCI bridge, thus switching SID to
startbus/endbus encoding (now needed for QEMU).

Let's make it simple and assume that the root cell programmed a valid
source. Skipping the test will have no negative impact on isolation
between cells.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/x86/vtd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hypervisor/arch/x86/vtd.c b/hypervisor/arch/x86/vtd.c
index acc97919..ccd0bdde 100644
--- a/hypervisor/arch/x86/vtd.c
+++ b/hypervisor/arch/x86/vtd.c
@@ -805,8 +805,7 @@ iommu_get_remapped_root_int(unsigned int iommu, u16 device_id,
 	root_irte = *(union vtd_irte *)(irte_page +
 					(irte_addr & PAGE_OFFS_MASK));
 
-	irq_msg.valid =
-		(root_irte.field.p && root_irte.field.sid == device_id);
+	irq_msg.valid = root_irte.field.p;
 	irq_msg.vector = root_irte.field.vector;
 	irq_msg.delivery_mode = root_irte.field.delivery_mode;
 	irq_msg.dest_logical = root_irte.field.dest_logical;
-- 
2.35.3

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f70e366bb77de3ceb59464a943cc5430e69ed7f4.1672643463.git.jan.kiszka%40siemens.com.
