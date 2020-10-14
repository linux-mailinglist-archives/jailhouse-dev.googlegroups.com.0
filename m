Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4F5TT6AKGQEJJDKQ5Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x637.google.com (mail-ej1-x637.google.com [IPv6:2a00:1450:4864:20::637])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CA128E39B
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 17:53:21 +0200 (CEST)
Received: by mail-ej1-x637.google.com with SMTP id f11sf1342393eja.23
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 08:53:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602690800; cv=pass;
        d=google.com; s=arc-20160816;
        b=aVF4iYuFSjlBDfWI04B3UfnSl2bO7MZ/wZGS80eBH/CHX+Z78JuNMkRSt7KRXL1fde
         1c0Z93dp/8RdkjclCk6TwwK4HL/kWV26f1wIBfTk76rDMyl4VV5cAfjxt1ZzYpnbK3ov
         w3nFPgy/v0ZW9GCSkt6C4QmS9EVqeZFPnOz9tkG262djwkLxlcrWYgXh3BuP/x4FisRq
         rskEivdPUzfmYOkVUPIghB3m/4HfHduKODQCuU9iKo5t1ZeIZSUm8e7vW2VxfM2y9X9x
         KEqVFXyjfAZa3Myllu/eadaneB+w6GkMuFjZukzmml5WBMA3fq9OQoJo7oSYCLaB3mpV
         i9rQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=/8/ImoH0BIBMyCdSkO11V9AKYH29MDw4TLR3F/FN0uE=;
        b=D1XPuY/VhgI35VKeUqyXQvHKllWgvneNqUmdwQmf5q34NgDrCRlex9R8tL5a4w59Uq
         yEs/aBVHhdJHWfDuloEtrr4hw48XlcM2B1VuucXshZFmBNozX8wWo45ahDPBhjsbikJN
         MgJIfLX3y4JILo2MLldESccC9Gx0j/T+bOuC5GvNMKayitz/SJ+9RWcEZ6SCxPVcXa5l
         gdjI+9/WdFvAy73+fzmn0u/v9PYAOyoPTS2mDunYzrUs+p7vVJtHum9fwvzysGFOzj5t
         wF9nEbzg2nVLDgn120erwCxfByyks+/OnXqfIU/JURA7T/eY5wLMJmKLZtuKCwKckRaV
         qfLg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/8/ImoH0BIBMyCdSkO11V9AKYH29MDw4TLR3F/FN0uE=;
        b=gLiPZaiq3vbvGfES+1pdsRnUp4+tM5klZlXS86suZ4Tudjnm2sWa5vznDmJBHRA4ki
         6B0CfBglm8SD/b3C2QrQEc5jOishV7EmmNeg+S6a6EnPJhMS5sHQgh9xoqAB8laglpQw
         X1O+GG+LBhxUaWUNz6I9hnd2pQSApjGwbm06pxHBLPs9zo9+e/niA19tksxoxcoPtz/I
         4aJP9NPjPMoFJySxpFEC5xYBhzg7E1P+0/mWGwpC1RqG9jhwGO6SDaJ+EVwUyKfb3f0F
         xUpAQUAoo/DI2LK30GHUZid7qLu+RuPkKcyrKrDTvOP8B2DN28YMtzMc1ScQ/St8uFxN
         7gkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/8/ImoH0BIBMyCdSkO11V9AKYH29MDw4TLR3F/FN0uE=;
        b=g+XR3UW1IYR6SoLBnL7XSeqqaPE2r/hNMCj2alB4axKwPrIN9oya2QEi/u47LqPJPs
         IImEu6MqrYWJZEchSgowMRHW7T006QfQV/VNzc9xuDE6S3t37vkDOEaRF5DggDjaof7Q
         UxZ0sNyx7nElSdMShYTn2dvuH+65j/ela03wYHx1NeA9SEpNOFFYgn69vaYBrZBLOUGY
         5/gX1To3IyHIYubedLajEG+vI4cD60U0Sgwnb85wZtPP0cWDWd68zdVsTv6fRyKPYCG+
         eyc0KrRfySKXYcqbr4BZBNcmLNHmNVtaiWQSpo/+86l+lIqWlsrChcN77N9jRWzhuIZ8
         aCzg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533PhmqxEsQ6b6EildOxG2wfl216SDbUJocaR/Z0PfJ0eXBGn8be
	JgbbYTV2QV0AFm2FTf0LPVQ=
X-Google-Smtp-Source: ABdhPJzdWU/D1cg/TWWn3gn+k3kk8vkL3WIkXK63OmywakIvdwMvo8LUSQlpq81tZtTcylbZHiYUZw==
X-Received: by 2002:a17:906:5249:: with SMTP id y9mr6265609ejm.440.1602690800548;
        Wed, 14 Oct 2020 08:53:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:cc8b:: with SMTP id p11ls7869edt.3.gmail; Wed, 14 Oct
 2020 08:53:19 -0700 (PDT)
X-Received: by 2002:aa7:cf99:: with SMTP id z25mr6058155edx.139.1602690799234;
        Wed, 14 Oct 2020 08:53:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602690799; cv=none;
        d=google.com; s=arc-20160816;
        b=moD4tbFyg/f4z5HbGfuP31bAlk/bPQHUlVHVVPH0jCPmg37ZpDDc0UmxpopGL17hLk
         t+/4Ejis06lo4E9QEvhfIqmMNWJy0tGRbrOb5M0I52y2Yu/wN3MynYu6/LjXz0ELuhV7
         c/jwWJTe+LXXVb3t9etX1Ty4rmztTXBMhZj9EefIrVuxyaJICzY53laA5DWga07Qg+AD
         AIWpC8CMSPD29mY/qWcSscNbiSjk96U/763ydhKUGqEGo6Cu7vCc91I//gDY4TB5faG5
         soj7GXN/HM8fY7s9Nekk86txI1OD6LcLOZZ0jzHrz/p5G0O1JbgYj9cduvdurSlekWzq
         hy3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from;
        bh=UNqz0VRnd46dbsRDHBT8TPorOrSVpjEMhr5dkQShFwM=;
        b=Am6aewDlnZNubLeVkSKdQuvPB/AW6X2eGT1d/MfStZRT0/AALWpD+wKf4SNxlG9SIN
         jpKZiO0iaA1w0Z4Xl1J/Jw5oIfReYvUBECbrrXvM3KYaHekVSS30D2h3QzswyAP9HiXH
         7b12p+6FfS0v2ZTlmLJT/iJGqgje33gzZv89HFAAGsw96qd50pqI0m4uIBdw1q2t+44Q
         x8cRXO/gFL0qD71tG4QKzF/LUjv46qMTvjeAd7OgwlJ2HIpfvZT3DG5EgvyCpRulIy6c
         AcMMLHC4Iasp1yxRUzPdDcLyOp3NCcA2Ekh9FMfCh92WrogopCIAQY42xQcScqp9lDLz
         YjvA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id u2si925edp.5.2020.10.14.08.53.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 08:53:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 09EFrIPp009119
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 17:53:18 +0200
Received: from [139.22.132.102] ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09EFrHRo019863
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 17:53:18 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] tools: Fix naming of tool in Makefile error
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <d0f6e9e8-048b-eac8-2111-dd8dd5e46bc7@siemens.com>
Date: Wed, 14 Oct 2020 17:53:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
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

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 tools/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/Makefile b/tools/Makefile
index 66e88fac..d336369d 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -50,7 +50,7 @@ else  # !HAS_PYTHON_MAKO
 HELPERS :=
 $(info WARNING: Could not create the helper script to generate \
 	   configurations on remote machines \
-	   ("jailhouse-conf-collect"). You need Python and the \
+	   ("jailhouse-config-collect"). You need Python and the \
 	   Mako library for it.)
 endif # !HAS_PYTHON_MAKO
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d0f6e9e8-048b-eac8-2111-dd8dd5e46bc7%40siemens.com.
