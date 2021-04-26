Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBBUUTSCAMGQEVIOY55Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 0956136B939
	for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Apr 2021 20:44:23 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id 67-20020adf81490000b029010756d109e6sf7869638wrm.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Apr 2021 11:44:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1619462662; cv=pass;
        d=google.com; s=arc-20160816;
        b=iof4CFbqoGZoQMXCay3smdm8bp8tlw9SultHldswHgKnxTAHs/ky8JI2+Ll3FGvT/s
         G88f79oT9759UFygToarVIeegtDTSWs7UdRBRT6r9bzJfibY0kmtGvip2NfCMOxhOpgs
         dFl1+D74dn2Ji+WJ/QbC4MDu713QMs1nSpzz/hzT3tDxTE5FN1zCJ/RGgwPMEDmE3roH
         EwFUns5Q/b2bhzborORx77kBTfNdU3xePoU+zHZ1F45mrpZpMyTOfDpLFxNb8NVpGOVU
         eFEBSq/jXU9II3ePM8LppbOtR+Lv/FnrHQ/cCTeWuWV3G2qmb/w9sDqbvPq3JA2naByj
         iviw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:mime-version:user-agent:date:message-id:cc:to
         :subject:from:sender:dkim-signature;
        bh=+k2sRmdM1Quq+0/b3Qd3/nOMRAoy4CT70OkRsnitCxw=;
        b=B955/xi15pFWUXT/Mrzxxck4Q595/eHQ2ErNIPzFprAixA3OgKDcesdX1RrLq0yhDZ
         wN42xjA6LsJ/n4ORY7K2LoDnWaM9RGLv1DV69itFJJ6ghHyYwMg5dY3awcyP3MI323ma
         SdvMzDuptygGs3eElTBtnBZKe7OfSD26pO21psTxAaGytTb709hP/5aOgCI2vumo24Pg
         7Wj9hIcY5Z+eyE7kMn6mtYzZMIUwnqz6gr5mSuiXlGssTgZYPO3UatHK8e81XMLlJHK+
         uRqRz2FtOBf2weNBtkm5BlU4SrjECZdL8++EWNVuDpC6GoaycEv30WoqZrl7HvgLkmA/
         5TKw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+k2sRmdM1Quq+0/b3Qd3/nOMRAoy4CT70OkRsnitCxw=;
        b=FJDzUV5tWmDJ5my4lSwsg1H2MK5PuL51BENHJPuawTDCJLHo3pNFQb920bWP3V5Vdg
         CCT75i/YQAg0MvKIdkHv5b2m3Wf+aVQTgwsm/R4SfnGl6FoX1s8CSOOlsmlr8wRxkfIl
         H9uzAvIefcgsDpWxTg078XROVtPuwne8thDyecD2TbrWql+SvYtdat/IMzzTrMWaxZWa
         QSSmq9c2GZQUtOWvYv+eFjpnyx64sAq2SBgWViwzc2IfDatr3LqyEC2yKbgsaIlRppJT
         pRs7evKcqIdFdaxN8uhXHRrjK+hrNI3yLmvJCGjDcT+NEMjo2kGmQ98/+ZJdRP49bh+G
         G8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:cc:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=+k2sRmdM1Quq+0/b3Qd3/nOMRAoy4CT70OkRsnitCxw=;
        b=BiPTzNJ3LPO88uo7sMuo6leOQSkvaMhbS18zU3TiHRTNB3UkN7OKfKWSeeeTqOcNZi
         pjHUVgBbgNr0/3sYBMYUBxP2DcM13C5MzSY/hVTjb0YOkVcdz5lv7hlI3PPz5e6LuPAp
         hObhOqaLYvcxkgYaIdF9lYtWZAvilUDggVlaygoKbED/n5/rpIgz+RgQj7RCU7FnHOd+
         yov00R2EHMWkB2IyHkTk10Y4mx/Mzso7L2XGYqQYUaldT/KobEWZNCK4J9ziLJJC3FZR
         IuQiRBDmSmPpt5trvPzARgRdFgVrDusRAg1s+EAbjjpWaRuyO/IOBbSIVrWA40WLM6/Q
         C7rg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530bJBsTKmNm3EtrvEhJoC6ZF3Ak4Upvg2D2kdf3QODwnS2m4ERI
	gptZ34uewTSnMBe7c3RhSds=
X-Google-Smtp-Source: ABdhPJwVs/WiE3jrY2xd7ABU9icAF1RzXMo5oXP2Wjd8dtg0/Yh02EAZOd+bo5b06UbE1yMkoIwDNg==
X-Received: by 2002:a7b:cc06:: with SMTP id f6mr409574wmh.178.1619462662621;
        Mon, 26 Apr 2021 11:44:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fb47:: with SMTP id c7ls2871484wrs.0.gmail; Mon, 26 Apr
 2021 11:44:21 -0700 (PDT)
X-Received: by 2002:adf:e58f:: with SMTP id l15mr24274884wrm.175.1619462661586;
        Mon, 26 Apr 2021 11:44:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619462661; cv=none;
        d=google.com; s=arc-20160816;
        b=WVb1MfOGK+Sr5h21yaVfklLD6LwQQg+H7Hka/FjdlRPD30KJ6Wjvgz5Ij6HxxBC7lX
         wUshxNY4SlFjGLsnsy2Xd+zUSxDE/AoYkX/a/qSDdxQW3JneAMspW4xamAzMS3B0n12F
         Long5nWyFdBAEYU8mXB9HEsOy56lN06IFs3q5ELhi71Sa/Dk7SiDNqDYD/yznpM25n2t
         zr86lc17A+OVLy3rBfD2qn+unNvjixlcPd+uauaY/5rfemmUyS5rUWDrxwrihqw9jdkq
         BArZKOe/1ZSELUuma+bgFu0UFmlnp4SnD1CepF7oy9fOX9yo7UxILx1gBRLJ9SyeMms7
         uEYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:cc:to:subject:from;
        bh=anK55hdArTYHauN1Ou3R8FRk2LD3/f8pqtMJcjvjE+g=;
        b=0CvtAcZRl63TdE94WO67nJqvBTy8EJrJWBQwe2zSIIWaEljFkKIwl/dc+XpLUI2RXI
         hgnME0Ku5JXHSmVFhM65BoNu2ucXQdzVEkf1gL0SkMgO1Szz32SxwRpFUCPWuWbA62Lr
         AOgNKTqwRQM55DMf9R9uSerIDt4pvFVJjedJj4PqY2eD4npOJZJJY9ihcB1lkGGEg2ZU
         cBF5tNtU/HXXNDyiOB6wDDI8OacDmRgVtOOD71t/1uPpqEPWIqXuTAI592K3LIbGzIw2
         j0B3KkmLinEXJ0/IuWRzogZRg9U/JJFineIn/WziL434FbK1QPsZZQ0lBzYd8sgVpwKl
         fQrA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id x16si1198835wmi.1.2021.04.26.11.44.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Apr 2021 11:44:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 13QIiLY7010772
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 26 Apr 2021 20:44:21 +0200
Received: from [167.87.23.165] ([167.87.23.165])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 13QIiK0e000319;
	Mon, 26 Apr 2021 20:44:20 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] tools: Fix mistake in jailhouse-enable man page
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Johann Pfefferl <johann.pfefferl@siemens.com>
Message-ID: <1731c2a7-948d-7a85-1594-2e9763a1e9af@siemens.com>
Date: Mon, 26 Apr 2021 20:44:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

Reported-by: Dr. Johann Pfefferl <johann.pfefferl@siemens.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 tools/jailhouse-enable.8.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/jailhouse-enable.8.in b/tools/jailhouse-enable.8.in
index 9c06fc9f..b2c0fa3e 100644
--- a/tools/jailhouse-enable.8.in
+++ b/tools/jailhouse-enable.8.in
@@ -43,7 +43,7 @@ Once the jailhouse\&.ko driver is active in the kernel, J=
ailhouse has to be enab
 <sysconfig.cell> is a Jailhouse binary configuration file that describe al=
l present hardware or the necessary hardware for the root cell to be operat=
ional\&. This binary configuration file is obtained by compiling a config f=
ile in C language format. On x86, the following command can be used to gene=
rate a C language configuration file that represent all known hardware:
 .sp
 .RS
-\fIjailhouse cell create\fR <sysconfig.c>
+\fIjailhouse config create\fR <sysconfig.c>
 .sp
 From this file, the system administrator can remove all hardware that shou=
ld be dedicated to future cells. Simplest way to compile this file into a <=
sysconfig.cell> is to copy it in <path to configs/x86/ directory> and launc=
h a build\&.
 .RE
--=20
2.26.2

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1731c2a7-948d-7a85-1594-2e9763a1e9af%40siemens.com.
