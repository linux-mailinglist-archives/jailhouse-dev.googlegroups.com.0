Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJP37TYAKGQEDQE4ODY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C53813C94F
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jan 2020 17:28:22 +0100 (CET)
Received: by mail-wm1-x33b.google.com with SMTP id n17sf80101wmk.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jan 2020 08:28:22 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579105702; cv=pass;
        d=google.com; s=arc-20160816;
        b=IBjnLHBhSAl53IKFpwHzPrb8pdYFoANMJh6MA0wzOJrHzduf41YAPm+ZcWIhoVQl1/
         Fw3h1WuD2LsyjrUzgv4bNYz3gKqo8XuXEGfxm3RqddRje6mHjm2W15GtASZquiL0xA3D
         ZAhggYD6Vu8+mslegIiZNwBAQVP1dbT+zQyZC0tqkgtZ2j8RtcFw75WoU9qNmFbaivcM
         xctSSdQwd3woK7jMeovLbdXxEPgva0QJpgO6qhitvPRBmrGXqZqQ9111oEm21VkCRAnY
         ekRi5cRzHFgl37jD7oavM4R/LxPD7SIEG1HxXwJCRm5QF4FBTcM75EIG2O1kbHPnSUDo
         zqTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:cc:to:subject:from:sender:dkim-signature;
        bh=WN8tYuioAAWAWWMycM5TqonthjsN51OWZu/hKmKulTs=;
        b=fkzK4nTPJD2yM8ZEkCR/kh5MhTqI7cU0KC6l87pSONIhCUh9CfesT729DvriwVRmxm
         D56lNv+KmAxUNxr0Qi1OUhQOChfoLoQx1Cu5mFmqZGQ6W4ALrQecGQRrSt9fdxT2b8Xi
         FZxS3OvWveLcv0Ly58ICtlyZSxgaqlUk5jEazTmRpYP66EHTOJSv2W/uLNOQ8cN/M7sB
         CVSHvIYZ5d5duPCIdl1DwtVSSeNR9j8fnavMgUrAHsYOEAh/cmcYoPyLNgGMQTvtpw88
         8xOe/OQloMo3uSlWNti6EmfIvHhTy4zLAThGGzwqh1ivO0kdNDXjYKKdLE4xyifIHcfS
         7W+Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WN8tYuioAAWAWWMycM5TqonthjsN51OWZu/hKmKulTs=;
        b=LkF2UIW94ASuICQtM6kNyfbadY91um+uYmsHOJvWvG119cvP1Ur7uulnCLpPtI7eDK
         sl1vrTio84LjhQtbfmxL9sgMfdlN9QEYhQXNsczfTo7DYto5zfYbgmZUitnDcZ6jqA7l
         gjEoI23OcgeRCH/OsOAPEqAobSh8zzVzrKhHB9POhGmr0fnhTShczw4EzKUjLGxRXN6h
         eR10RSE/nUaV19sLZtzN91tuWh4uiAPu9xzg4QNThgSJ6/qqIaUKBplXBDT1Oe2sCeHh
         APXVOq7DX7fY7zOdQuIZE+A6wIXFEXgwoa4nTekZ1kSxXI3O+G8ZW7A47SLA6gjlv6AA
         Uvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:cc:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WN8tYuioAAWAWWMycM5TqonthjsN51OWZu/hKmKulTs=;
        b=Up/C/O1/FJkI3SgnjFb8eXgkRa6wCK1XPOArGs8VpEA9Wk+zbgnJIvrn9KLuNtk12o
         8Jv8dL5eoiWTRqpFnybqbuoT14Vi+mncgs6XqO52lEUah2JGqBaxINRRINhG8meF81p3
         ef3qNFUZUGdonYYY/IbCDtTTJ2ADzX/kQbDh4MhG3EubH+1u0GepNrJiqzxipVsQhCbP
         +CEnC9FAT6eaq9ZJCClUqdZGdJSkP4xDthVXK1xgfTydMHDWihUzwykYPu50Ay/K2HJP
         IIABedFN3CJKRQXMlotmzOGA9rFb233U1430re94O87AOB82HtFCp7703dAG/LhUc303
         ky7w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWHnVV7/HaannCSZrIOWW62e/MHjrQx6QABeuF7fqggZuWC0hNF
	7qDJ+V+9pvZe988LhYHHT7A=
X-Google-Smtp-Source: APXvYqwy0C5BEfTB9QcePDithfo9Fw1/24q8axIQLa8rMik4XYytcMHpEz7XxP1UMBlQvxokohSw9w==
X-Received: by 2002:a1c:66d5:: with SMTP id a204mr681349wmc.64.1579105702064;
        Wed, 15 Jan 2020 08:28:22 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ecc5:: with SMTP id s5ls6995970wro.12.gmail; Wed, 15 Jan
 2020 08:28:21 -0800 (PST)
X-Received: by 2002:adf:fa0b:: with SMTP id m11mr31755038wrr.98.1579105701089;
        Wed, 15 Jan 2020 08:28:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579105701; cv=none;
        d=google.com; s=arc-20160816;
        b=OUNS0anLtls4GabBG2bVXFyGZ4JUWNpbLzjTfz7imOKT0D/DEFY+UTBLsZQlrY5UlO
         mSlEvvpNr4q2bdJN/8PLym7ztqoHuhm16dg+oPjNNlQBrz6590zXcbHNiuBlAVVv8Ksr
         sBMiV8vL4sDMoniesmKesv0q0DNiGiRgya2jPywq3D95wlTDpxUqNZk+zBmEyCosczUC
         cjDnfqqn9sUvnYU/guSitr43yGZ94mBTG+SC3GfguiXuu+6H0M721IvdtAYl5yREXoV3
         0dbGIXZJ1YIQuXrrfmidfNxoCCHfKCsseto+AEpHJ5z5L2SN0t5s03nOXwxYoCFBxVxM
         2h6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:cc:to:subject:from;
        bh=odT32Y68JwAF5MOu++aHAygDTwRhOF7wdYmcp70hWAI=;
        b=WUA0drkwBMy8EML1/r6dwD9D1n+FhJlUsnFLLmHsYoDddVV5WLXUFAbYj6GXs/ublY
         oAjfK6lZXf6q2WL0/o9CqjKVQpcyGZ47eH1NFmpmQozEYv4dAd7XM/jet0I4Wr2j5xK9
         KQIr0/lUkWxp5KK7ciLTFiec5J/5TPImGpGBxvczIx6iPasLuDY3f+pB54eAOfYAr/4j
         WijR6tq89+XOHtQCmmATCmowS/P4j6O5ri+R1Gm73Bp2AjwWTQOUD0sU9Ax59A+fV3lq
         ifPlg0MGw0Oz4bchUX6SB44AyWiWURASlW7RFcv1crSpE4J4F5d4DQEjE19mzdPIYYuS
         eFBg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id p16si782500wre.4.2020.01.15.08.28.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jan 2020 08:28:21 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 00FGSKRu013579
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Jan 2020 17:28:20 +0100
Received: from [167.87.12.136] ([167.87.12.136])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00FGSJlN026091;
	Wed, 15 Jan 2020 17:28:20 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] inmates: arm-common: Fix indention
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <5917b391-654f-a3fb-b18b-4683f138c64f@siemens.com>
Date: Wed, 15 Jan 2020 17:28:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

Use tab instead of spaces.

Reported-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 inmates/lib/arm-common/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/inmates/lib/arm-common/pci.c b/inmates/lib/arm-common/pci.c
index 99210c21..f47d7a76 100644
--- a/inmates/lib/arm-common/pci.c
+++ b/inmates/lib/arm-common/pci.c
@@ -50,7 +50,7 @@ static void *pci_get_device_mmcfg_base(u16 bdf)
 {
 	void *mmcfg = (void *)(unsigned long)comm_region->pci_mmconfig_base;
 
-        return mmcfg + ((unsigned long)bdf << 12);
+	return mmcfg + ((unsigned long)bdf << 12);
 }
 
 u32 pci_read_config(u16 bdf, unsigned int addr, unsigned int size)
-- 
2.16.4


-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5917b391-654f-a3fb-b18b-4683f138c64f%40siemens.com.
