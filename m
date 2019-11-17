Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBBXAYXXAKGQERH62PQI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9BCFFA9B
	for <lists+jailhouse-dev@lfdr.de>; Sun, 17 Nov 2019 17:06:31 +0100 (CET)
Received: by mail-wr1-x43d.google.com with SMTP id b4sf13948240wrn.8
        for <lists+jailhouse-dev@lfdr.de>; Sun, 17 Nov 2019 08:06:31 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1574006791; cv=pass;
        d=google.com; s=arc-20160816;
        b=g5xkNFkG5PlPYVLOFxKCPM9bjeO4QLeX2fSZBrVngQXLakzqTJvkQbcgURWx6+8rUZ
         OXaskxxMK04UZq/v2rBpbBG5EuXCFV/fxc34J1PwDquV4jEHQoPkUi5SBon/8oN1S5HM
         4ah7Dnc5Qd/MpNQl0tjYsH2jQzYw0HpObypQzCkaEkrw0XA4WsLHG4tsSwwS7RdvV2aD
         IY3K0U8r51IsMD91h0VIIcCb9jidHNvfDTl7o/c6/1otIlj6TOsoE6mAeguf18ILHYSM
         yUq1yQydCFEAgscydCEm/CH6ThY0NFIGVMflPUwQ4LOATmXKmHilpVjmGKCy9dwiNHL1
         om8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=N4rfTqbsvoj2xhmh2hvl3Lc+YRk+AdDtadd7TOA69F0=;
        b=OZJAtxza3PZyAScv1iAcvp//iCm94FMpmoX7tUaXw1kFMTwWe6JT7nhjCuYTrzA55a
         hEtrJSQjRMwzPtqoP0OIRJsvINUYpUQOxVizbbdqVEC6XxTms5sUzCpHhlV81A/6WwLh
         /i3e8Knyjy+ozmUG1Mrm441Z+dgNlyk4/4TjrAPTxGfihFEJqQwVfSTl2Qxg6qkH4OTo
         BCnDHfD94eMdcjxNZTsZDTbsZSrloa2YzzVNiomDJ4HOAn1xMOpgfNOdAa5ZC7MJ1BC7
         lLA06RmhhaGesugzrN4bWZiiwEFbfLT7jfVD/nTmJZm/cGR47k1AKGKVcE76xk1iI2dg
         dPNQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=EHzAG8Gf;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=N4rfTqbsvoj2xhmh2hvl3Lc+YRk+AdDtadd7TOA69F0=;
        b=FfL9lqX/JxGhftKYVPU6XIJdvx6rbEoyvpjgQVv6c/BqgUoHdsm5vchV1bldtoMbq/
         hFnlX+kPAFjjXkievMI6C4eFefk4pc+0rp3E7NByEBtL0WrXCdhOmAD248q0ICTtsgVS
         X8Bz9Yr1BVfmUAwvEpeMmPjLeOJxV0ZYoLlOeEEs8CYfeXgsu2hR3pCA700ZEQy7C5O4
         1qin2nrWzCOYglPmRbMJcjkhm7aHyf6usl8gPEP551cwABZ21FsaiLYEqlGR4zW1gL5Z
         sOinbBXrIzgsU+i/5lClQBD4uRq/P8EkTgfUkQ7mFJeomQL2N2aO/evjKjyQ8xmC1JkZ
         rZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=N4rfTqbsvoj2xhmh2hvl3Lc+YRk+AdDtadd7TOA69F0=;
        b=GIbbUdJeBxaFttYdikZOdLDp3y3MD80/xUa9H/NfaE8p3hUGwqfSTmRH+GwsxX/HC9
         /zQk8gVgggpIz2cFJ5LtpL9iH3DBnty+tViw7OETBIvueAY0iW8bbEmUza0PTWs+Bd8Y
         47Hh2AGkLgwN8gbGLedOMkgPXD12nROKBJoIbV/g4PCAWxsXJZtqOOpE6SzyJ88O90mu
         tbAgZ2cpe7fUi9I+xBPbVsTvowpObOLnb8AsFlbBDDs+53QaEb+bEqX7hzWTXPDBF3vI
         QGjUOXAMpJuA41P/Fcyo2x4/5ZPggzbjh+/8piBkf7O3mGsnZ0g4RtmmUltXJzc3v+Lg
         bOOA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWVW5vmcXKrDj87TaSbk7x/alYEVSJobOlbCzY0ARI2Jpd6VfWf
	DEWEfgNbDF7HlocbXCoaZKg=
X-Google-Smtp-Source: APXvYqygEc81Vyfya3n+EPu1HpZxM1hmNjXbGyuI/CxdMlU7mbXxMd90Ev809km595I85CyP2IiWYQ==
X-Received: by 2002:a1c:9a81:: with SMTP id c123mr23801374wme.118.1574006790960;
        Sun, 17 Nov 2019 08:06:30 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e8cc:: with SMTP id k12ls27612081wrn.9.gmail; Sun, 17
 Nov 2019 08:06:30 -0800 (PST)
X-Received: by 2002:adf:ef8a:: with SMTP id d10mr16625332wro.314.1574006790410;
        Sun, 17 Nov 2019 08:06:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574006790; cv=none;
        d=google.com; s=arc-20160816;
        b=mWI65LXusf/W1aNnyXgIJZYlel+shJXO0RDD1smgQ4NhVDSOcZ1L67Gfs5rzPdCFOY
         nsSnNycAecn5L9ikcw7e6KO713NoI9dVqECcdLYncIWr17dglSWL5jkMHeycqUD35K6U
         tnbeQBP45c6azHrvMGnzYnOURJ+fWApiAE4hr5hlv8Jg448grU60mOipZ7YClE9tY5hK
         /JR6Q0DZA4k+0exenlU/v8WJxVOAGIsryrKFiG4J9Li17PGNfIl/oj45B/DAVXS2kAAx
         HCGOu+AuyAUrbkAee7TxISohEjxzDzkbSK1pWl6rDZSdsUR/qSbOkC8n7TWqrRqeNgQ5
         oEaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from:dkim-signature;
        bh=HnXPWb8QXGK4c9qj+o6O5ow+qfp+5m/YDgvagXRFbGs=;
        b=C+z87hMRrIv6B2ZyIW9Oc4EDjeFx1Js9bPwGyH4oY4tB3UkBqVw+0N3R7jo6kQTuF+
         38lVqIfg/iBL/3X3Hocsr1/NA309n7CxNc48PmI6yx9cAWXEfvneTAaIJeG+7fp6iaLK
         BeCVMgaX0Uj2eTcWySVN5uTb8ULLC4P1k4+jLHWlWVW1pgRB8bQMC9GlMnBDIYXa7e+E
         n+gfu4XSm0EbOm7eOlrOcURNStTqwRokwIFQu21hGccA6LuPqKr/oazq9DllWxhlJQDK
         hsAcDMAiWJa9wvOSKyo0BzQRGHL9DeMjhx9BJo0gYsctwTErNso++tPGPz4nM1lsCTH/
         7kzw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=EHzAG8Gf;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id r11si926665wrl.3.2019.11.17.08.06.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Nov 2019 08:06:30 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MNLNt-1iTtAV0Fir-006y1T for
 <jailhouse-dev@googlegroups.com>; Sun, 17 Nov 2019 17:06:30 +0100
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] Documentation: Fix EFI framebuffer configuration help
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <c7818063-8e94-7d5e-7281-20db6652e6f5@web.de>
Date: Sun, 17 Nov 2019 17:06:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:f2mhpGeu5TPEo5cBWkaQg6Zjy9D342INCrMC2UJJz5l/o3l5p7u
 iR/FyffYrfiLw861aUSF57x7cXaXD1h876vOdV55629BTXfsa+jZYXeqZgzNTGOjW6R0H/5
 5dM6NhUWs9Z18y/kGDBlHiM3xE5xtf89HAOaguAbv2afrpSUA12Rc3jl9SHJmTKcsNe1/4V
 dsg9+GTDTjTnDelgu8ZmA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:GP6j0A+5K6E=:UBCLm1QenUPNPYa/8pxcVo
 HdVJRvOmAM2rGfdg1dD+bx7in16PazYhqFOyM1e2nImD7layX0SKcEgsM4RKJwQ9bi5juXCmq
 es1pNfIt2u9y+gH163rjrgbvHBISWNwIDsvjYseNy8/dTlkM2YtM+n58FkGXiU8xtkyoJlPR5
 Fc23bw6f4sBUJMgG0eExkRtb4iNpmGBG5RbkAFSdgBgQuQprKMHA7Vg5PisN17DundOYLUyCm
 OCC0SrBSjmg8yVE/iSPtSZD1Pd37zwJ+O0BdszU2xns+4ogO1wyObtPN5tgszVMSJmJM45HxQ
 LDhLZO/JmxpRK8CTnu+ZGJxy2vuvVYMuRcMd6Df3oIBmvqRwmIn+N+EAttsJFFsp5O7yfyney
 prryoHZS3ZUsu2GfLUyU+G5PsPnZ3bI9+lRoy6VzIa1pP4YdCF0Xv4n0l4XUOML90iEiXK5t1
 FrNtYMh+NNG0iPN0jJwXbmRJEqj06BZ4RNxm+hAyqZnZVakLmU0UYBocK2gU7FMtGFfit+nDJ
 WtNZFKcInpZ3ctsQpzgPswmeiBWj5Oe2RQkq0ES1XIB0wfRgZE7AL60lv/62nj9uY5OEOa/KC
 LORNYYMPxEBOczMx7FgZqKN0UVT8F6zlJeZvre7KUELj5L3y8PKHzjNNHkeH+MIaJhjqimDW0
 ee00O21Cxerj2oMDIYWS51mGZYKaXYLQkxrVtxnezuvRCVx3q7w7XNz6Q3QPyLr+dUvhlNkLB
 DfdiugDXeIRY41IcecL2xkhC306V/t2ug6bBqE+WOz1ZSLjCoNAK4WMroYEH+JvoZIUFk7XGt
 OodrihWam4CwXjFcNUAflV3iQxjP5ZYfYTUhNFOXYiw4Cvrzj9YdCcEvUc8+mOhK1m6XK1eQ5
 QrszSrwOhr/TNXoHpOp1gekAAe5fx8Dazdi8EiejbLshHEPTIjIukJAkCLanBWQw3bmWPtTFQ
 moHOFvHjlUhKFU2NQbQmc3DDcQ0i9HWjfUFsQ1akv5fdGosJpksf1Kl4ImpYYVMn0YYdG8/uv
 KwyVUto4FastYeo3DCfiWy9fkZGYDE5iz30kPhabZGZOkPU7NqqWg1nnsY4bIFe5zvPJTmnXE
 r8yOe9U7JMyTssJNSdAPC70Aqwmr0YkALkYii5iMDLSF+HNL0DvjAcConrXVUC87gUTI09hp6
 kZHd8zsI+aOkLwVRFpo8OR32N9ZwFhy7mQAHSOD0WH4dqj2SM6TlBv5flCX64T3K05sJeHKxX
 am+xqXcIX16nVoxcMvsrsQriOpd0KwhFTfwvnvJcdo/O9BzTl3nAztE77QLU=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=EHzAG8Gf;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

JAILHOUSE_CON_MMIO is mandatory, or the driver won't map the
framebuffer.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 Documentation/debug-output.md | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/debug-output.md b/Documentation/debug-output.md
index e3cea6ba..5bdc412c 100644
--- a/Documentation/debug-output.md
+++ b/Documentation/debug-output.md
@@ -93,8 +93,9 @@ Example configuration for EFI framebuffer debug out on x86:
     .debug_console = {
         .address = 0x80000000, /* framebuffer base address */
         .size = 0x300000, /* 1024x786x4 */
-        .type = JAILHOUSE_CON_TYPE_EFIFB, /* choose the EFIFB driver */
-        .flags = JAILHOUSE_CON_FB_1024x768 /* format */
+        .type = JAILHOUSE_CON_TYPE_EFIFB,  /* choose the EFIFB driver */
+        .flags = JAILHOUSE_CON_MMIO | \    /* access is MMIO */
+                 JAILHOUSE_CON_FB_1024x768 /* format */
     },

 Example configuration for disabled debug output (architecture independent):
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c7818063-8e94-7d5e-7281-20db6652e6f5%40web.de.
