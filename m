Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBA4CSTZAKGQEJNQJREY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id D541015BA58
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Feb 2020 08:55:48 +0100 (CET)
Received: by mail-wr1-x439.google.com with SMTP id o6sf1991821wrp.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Feb 2020 23:55:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581580548; cv=pass;
        d=google.com; s=arc-20160816;
        b=X5blKVrZe/wD/9o5nUiokrfYeeAciv8zGEOo6Kr8jPyK6f4uGG6lCGa34l2hmaMIUD
         Ms7ibef5QmW7Zy2n8bsc9efOgcepU+28WJRZqvGYchJ7cZgqeCAKzei/jeNlWXiARklJ
         +mlZa4T3F5DS/haK2Z7Uaqg4U+QS5pippYpRKIDbXl4OBXHFwCOKNzj+7Crk5xe3E7J+
         6Md1Sk3GQYeimDwpPbSYyst60ghgsPNyTLRgU86NRzap0Eohq/sFi0Es83T6wFx1Z9np
         7Ob54HLKy2hsQxMbrDBmxChbNP1kZNBiO/IzGrLZxzRzwK9wl+nVa1kdct7uaX7i8d3Z
         Xvfg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=TmPoUnyXEc0WWz2jjxDWObJSjYhB+ISndIoz5TgHAVg=;
        b=j3cZ1ryBceft6qVTXyfuPEVoTNwbofjeBCyB7yA1Snw6pTrjpglwa9ZMi+KXZdxV9/
         F4WTzLfDzrOnaUC9Zif0GSAfnn0FfqHP4LACyoUWpp6IMKWOi6DBPB3ihpEJmqCKqCR2
         R9QudwrGGUjtQaI4i/npfMiyIiywggE3BVBm+Cxcqbe5w7xTQbWetlvFp52CqR/afxfa
         ajypqRhkZfHklh3M8VjuTSYDUeGkZIJe1uROXzU6i/zUsrvmuZ1FHB9KhKyoZedCNXAw
         Z48LqCQLQ3r3CbFYPwOfgKoJJgsxJ8GFx6jgBOxLD81PDGECZ6nO2uqxDXMpKrAWdQ1I
         balA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=TmPoUnyXEc0WWz2jjxDWObJSjYhB+ISndIoz5TgHAVg=;
        b=JxD8TL6gl1XRnDY6uy1dsyG5B7i1g8vBMNKvaxyAVeTPU+7dSroznMoaaTkvVs8of6
         RQax9wXcUPR2yEcoy9dF70RbxjpvzYspO+3NKB5xE0oBqlHHBEkCqRL94Xui/PLBJHuz
         7h35xcpZ1BOugnHLjnIMbsIEYL0h6pHlCMDpknshoyoXjfnLSb2RIsFlcWwORixPuRQy
         r/a4jbHAgSD57CtlQkMBsdbwvB+uimeRn1ooFO1CUK0w2IyT6AT1BQ/syob0C/JSq5EP
         wYrat0fL8u1uzovogO0H4NJJ//fvq9Nur1gDi0XOPwExGH1cVBlYOopTRNMSvRtLGYZU
         LdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=TmPoUnyXEc0WWz2jjxDWObJSjYhB+ISndIoz5TgHAVg=;
        b=TWI3+coXA9/vOz2+DZ5ZvCuqDwseCFZPaRNFrEm0o74fNSuJTZyAxzQO/bLwcM24PQ
         NRnJhi/dzNXF44aBYdeoIvxoyHofbmSlDIjj4TRSuDjsrdFLfB6aJf2pXJ6//k0VJwIW
         xxXcm5MPywviE/ELCvsHQhNot8XOR+0YoVo+GffFbDgcBbir0yK9n4Zl6TsWJhFQSJFK
         kl2dYdR9bCgu3jAx0PknLf993k+gxjRwNvcAqo4rbkp+z6xYst+e7QJsrKMxnQvzYeg/
         Y9vPrNmmubci2J6Vb2hP7TM1IsKrTX2XMe6Sc6L9ZGCHjrv3dHN/tO41UiBCIJs0H1ql
         P7/w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVQ7x+vBVDc0Nr1776DR4BYMGTWV/5QhQsCqJ0FSKURsoJyJUYW
	RtsVZesGZzkFfITx3HBO2L8=
X-Google-Smtp-Source: APXvYqzBEwqvNZfuqrdZ+qm78RKsvx/masxli++X8joTx3DM25mzuuHp6os92HNPx749KdqdaeK/Lg==
X-Received: by 2002:a7b:c216:: with SMTP id x22mr4345792wmi.51.1581580548387;
        Wed, 12 Feb 2020 23:55:48 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:9d13:: with SMTP id g19ls2180838wme.1.gmail; Wed, 12 Feb
 2020 23:55:47 -0800 (PST)
X-Received: by 2002:a1c:7205:: with SMTP id n5mr4399148wmc.9.1581580547455;
        Wed, 12 Feb 2020 23:55:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581580547; cv=none;
        d=google.com; s=arc-20160816;
        b=JVUZiGwYSObtJGJHdIv6Hh8EBmXeKvtXKRo0UXifa9w6gdXUQ3B3dpTOxnXXdDiDUT
         JM1gOFhRXIniNuh/Ifvn+R+XLaw1SEyQ49QuaX1aGcgXMBL+sgPSe/VDKyMWLZG7a2nM
         4IC1AmQfYVsmd1CkPnlCB9Zi1R/LQN/0XzzuqU7HK0x474cdG3s5AAuo4iKxsWNhQuL1
         dZCy6jh/zIrN7H7BP2hL+6btQz589e0T7SIZSbFFU7XZdNfKK0oohz9mJyMn35en1hHw
         xvNxlUc+kLKdDO0n994YPHRwU5dhRXXlcbG9P/urE3O9a/lCZKTmVEUVSMZ2qzJLHxXx
         0Y5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from;
        bh=MWtwtzj9WfXrqgfkjkC5reIJdJ1Q7y45tK4E4QlFeHU=;
        b=QjDDKlXmf4K7Eyqh0rKb9mDk9o/q/+Q7TLg50LuQB1i4E1FPk10N1U3QidUzcs9oI5
         9tQzLa+KugohR7jNhVhhHRtkefLzH83nkqLVL2vY36MilvT9gvJ9tQBBe702yR1KC490
         gWawlm62YGf+JHNOiy4HLF8qlWBhszMtiOd6CnQg5rwTdgOpTCUfsW/6edO+McJtTK5Y
         TupRJvaenU/kn2k3ZVKrEzUpA40mGJaDJ0gVzLVDf3aV13gz+CBXiWjLJdRYFXUxeZHo
         hFo2Tncum6prsso0OIx7ftBwaAFbTiMdGIKZnS8yQ0/chBMjWXOByE2bT8q9GUuUupat
         uxsw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id u9si78598wri.3.2020.02.12.23.55.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Feb 2020 23:55:47 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 01D7tloc026111
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 13 Feb 2020 08:55:47 +0100
Received: from [167.87.46.122] ([167.87.46.122])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 01D7tkqm020163
	for <jailhouse-dev@googlegroups.com>; Thu, 13 Feb 2020 08:55:46 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] driver: Account for constant name changes in 5.6
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <1ab95302-de42-4d47-c853-acc6e05d0791@siemens.com>
Date: Thu, 13 Feb 2020 08:55:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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
 driver/main.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/driver/main.c b/driver/main.c
index a9bd3384..41552b74 100644
--- a/driver/main.c
+++ b/driver/main.c
@@ -58,6 +58,12 @@
 #error 64-bit kernel required!
 #endif
 
+#if LINUX_VERSION_CODE < KERNEL_VERSION(5,6,0)
+#define MSR_IA32_FEAT_CTL			MSR_IA32_FEATURE_CONTROL
+#define FEAT_CTL_VMX_ENABLED_OUTSIDE_SMX \
+	FEATURE_CONTROL_VMXON_ENABLED_OUTSIDE_SMX
+#endif
+
 #if JAILHOUSE_CELL_ID_NAMELEN != JAILHOUSE_CELL_NAME_MAXLEN
 # warning JAILHOUSE_CELL_ID_NAMELEN and JAILHOUSE_CELL_NAME_MAXLEN out of sync!
 #endif
@@ -406,9 +412,8 @@ static int jailhouse_cmd_enable(struct jailhouse_system __user *arg)
 	if (boot_cpu_has(X86_FEATURE_VMX)) {
 		u64 features;
 
-		rdmsrl(MSR_IA32_FEATURE_CONTROL, features);
-		if ((features &
-		     FEATURE_CONTROL_VMXON_ENABLED_OUTSIDE_SMX) == 0) {
+		rdmsrl(MSR_IA32_FEAT_CTL, features);
+		if ((features & FEAT_CTL_VMX_ENABLED_OUTSIDE_SMX) == 0) {
 			pr_err("jailhouse: VT-x disabled by Firmware/BIOS\n");
 			err = -ENODEV;
 			goto error_put_module;
-- 
2.16.4


-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1ab95302-de42-4d47-c853-acc6e05d0791%40siemens.com.
