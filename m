Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKM6T2CQMGQEP5INATQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A31138C52E
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 12:44:58 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id c16-20020a2ea7900000b02900ef529209ccsf8661626ljf.11
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 03:44:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621593897; cv=pass;
        d=google.com; s=arc-20160816;
        b=O2qTS0wXU3Rncz97Uo4quLmkTgKoqyzw/F58oUaGVxcwTyVBQe+8CI+KkrPi/1CDcJ
         I5wZomqmycjGPc3oYS9BRsfxJzQwOZLybfRP4YzRjN63H21InxsPOjLnNNCgdAi03N6u
         leB/VgmAYfxcY204hEpiTrFaP48YWoLzOAhl4ey2d5wLgyQNdKf/Jfpib3ndGo2CE+fk
         JnyY4bkj/KHvxaxTXhwGgkmMA7MOkZz7Pw0rKu4c8XJIrO9dhyJ+Qtq/bHuy4zCZNtBR
         6FsXoioX3CiJ6s1N+Pu8SOPIAxfa8qZlgPxd1xtsODKEOUM0DX0u03igxdGxmpxWUy/p
         pJCQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=DSBW1TM3Yyqh9fJWrxjNqShVejAQd0LH0Uj0RU6b13M=;
        b=T5UoVdbrYdCc2/wfSSapbA4q/49D6c0M2kV/Zbrvyr59wkTLIQ0QWF2fuuBwRG9g1i
         HZ0iWF4YmnCmVTf6GUBrucq7HnFfLMfy0epoydGuHXqJAErl5D0b715DC1MJQbR1WkPE
         hcaJs1EfSVmmKL4m5PG/bkQbwvwES5vWpHljFDs2v9123WWOL7M2H8rq7knyZpIXMRZD
         IQwOxS6SrP8xhDgG1VppVFns35bBhvlcufBrGLOlIl5HOkY2LXbzZq6z29bVlGVLp5UH
         bUMjFqymw3fzhyK/5Lu1mitE1EdizHB+ccM3j4gQfrdnqgg4vhtKG726IQwaQeyDDsVG
         R1nA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DSBW1TM3Yyqh9fJWrxjNqShVejAQd0LH0Uj0RU6b13M=;
        b=FUUEz2595bFvtk84mDQm778eP+4wzo3WFKQiF4HgfOzS04DO6mF7ESsWLKMYQxIXgr
         zIjhH8gVFHgNewTDQ7OG5zSfuVobondfgmI8DS5uzfbO1Daoy7/bqmbkZipwrJnt/M67
         LEysErMPOUYq7dCAiTGfAmwjBNoXPTl4tafvcavyEEro9UVzpDUnHS/49h3hxhIQrIIm
         EqpsPpfA/+YKvUOgILFbeZ+IOli+EQgm4D5gEc0H6If0lwCbtmdzDRSm52KiVHr8f6cW
         YQxFKE7n2iqpEIiNZzDjt3wLeRpRRuD2Fjeyu5jzshKjXAXEkZizK7L1mjhx8OAncB1n
         vafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DSBW1TM3Yyqh9fJWrxjNqShVejAQd0LH0Uj0RU6b13M=;
        b=MG3q8MpORVYRBLRtGvWQagaRR6Q+jypWGJXd9J7wDBQP++rRAz97lAbC+OA3zAktL5
         NdR8WwLUB3xDuVBSlIQI49TeYn4D6Vy4EmWC8mpbz9pfB34UZ1l5VLGs8zBPOuSk9EKe
         VOx7L6HBGz2ANJDJ9+HFy7B7dxRlOWafHpx9iq9mMv0TRto3sfL8ph341GfPZ8XK9mRd
         s8B8RsPS58gyaY8rs+sDMsJUKHBARH67UpKv+GKAwYyN/j/g7Cfats4QbnhSgzkS+wte
         TATRnWHOFDUX5fZMxyUr1oKmKepmDLcRwdyCzQyPSEzHgmWoLGLS5C41yhNJlmY8+/aR
         dcHg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531AeN3bAElzG4ygQo0VQPU2Hon4tJIWkKieWX6LjaeHx+am0Qh4
	l8NEwvb0x0KEgMebnJVMrSo=
X-Google-Smtp-Source: ABdhPJw4uZF5Ubexk9RjFl+QU6PB8S3yK5F0JuTjVCrUNxn91g0ciznZAY2c2+fBqmpaZ5m2KzY1gw==
X-Received: by 2002:ac2:599b:: with SMTP id w27mr1762675lfn.437.1621593897665;
        Fri, 21 May 2021 03:44:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3f94:: with SMTP id x20ls335385lfa.0.gmail; Fri, 21
 May 2021 03:44:56 -0700 (PDT)
X-Received: by 2002:a05:6512:2390:: with SMTP id c16mr1760582lfv.183.1621593896598;
        Fri, 21 May 2021 03:44:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621593896; cv=none;
        d=google.com; s=arc-20160816;
        b=MjwLO9IXA6Ec14seE0HD7+eFUKPG6474Eb1PJDZarYTg+Mp9dKkLuCSwnOicLr7C57
         /VIs7M0yNZLPTmurZux8/95cvG01zIC+K5Sj/8Xmp4JAnzjS6MIdbrDwU43RTzFMibgM
         B2XALQC7VrAegntDNxmlOBuqAAbY4WMSod8dQlgjyXEXM9eo7bsFIaeV/D0eNPwMU63z
         /Z63fL6mvAiVk2nK14oh2DvlP8HW7N7d6ioPWc31Wg/PiAm8ejl5dqMExx+YsQc+2btu
         RkG0VYFiQgiT4SW4LLvh97joJ6DVdLDHAdg1bOJnkzIupCkQgP/tNYB1Umb3FFe4yygp
         /phA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=elgPq/rs2/uIw1oRsBMHdt+EWo/R9Ma1OazjtpJrcek=;
        b=pF2qeOKaZiHLllnllNHSZnrYG5YCYZclBxAlkJaEFOVKmbhQrF8aoROTTXhEHePTo3
         8pxPpOOTklmkEiQjKBFZb3xyKvmODTeVLK+OW8s00XAkYAVU9PqiWZeSkw6yO0uTOV7C
         LNa/eLtdvJYhWzmy75pv70cBb7zb7XMrW2Nnlo97vXhc9Bu4YyTCk/8DXPOYqQSnwCEG
         TcBWoenTMbooPzIMwAH0mZkSHycZoyUfDlt7CIuUfu2/Lech/+H5uvE1ClXIPl9NA9h2
         qKtyY6gbY5IAEofcRXUoxylUfHEvnC+mle3JErzW4n9WvSIhAoUDi8SCTMztWiUeC+ox
         ZEiQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id o3si284727lfg.7.2021.05.21.03.44.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 03:44:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 14LAittW009274
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:44:56 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.49])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14LAbYcB032504
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:37:36 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v3 06/22] customizations: Add QEMU ARM
Date: Fri, 21 May 2021 12:37:18 +0200
Message-Id: <9051daf4aa8c2365dc750a427666687820ab6773.1621593454.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1621593454.git.jan.kiszka@siemens.com>
References: <cover.1621593454.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .../customizations/files/.bash_history-qemu-arm    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 recipes-core/customizations/files/.bash_history-qemu-arm

diff --git a/recipes-core/customizations/files/.bash_history-qemu-arm b/recipes-core/customizations/files/.bash_history-qemu-arm
new file mode 100644
index 0000000..39aeee9
--- /dev/null
+++ b/recipes-core/customizations/files/.bash_history-qemu-arm
@@ -0,0 +1,14 @@
+jailhouse enable /etc/jailhouse/qemu-arm.cell
+jailhouse console
+jailhouse cell create /etc/jailhouse/qemu-arm-inmate-demo.cell
+jailhouse cell load inmate-demo /usr/libexec/jailhouse/demos/gic-demo.bin
+jailhouse cell start inmate-demo
+jailhouse cell stats inmate-demo
+jailhouse cell destroy inmate-demo
+jailhouse cell linux /etc/jailhouse/qemu-arm-linux-demo.cell \
+                     /boot/vmlinuz* \
+                     -d /etc/jailhouse/dts/inmate-qemu-arm.dtb \
+                     -i /usr/libexec/jailhouse/demos/rootfs.cpio \
+                     -c "console=ttyAMA0 ip=192.168.19.2"
+ssh 192.168.19.2
+jailhouse disable
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9051daf4aa8c2365dc750a427666687820ab6773.1621593454.git.jan.kiszka%40siemens.com.
