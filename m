Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQNYTWCQMGQEG3GKNHQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8E638C063
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 09:07:46 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id w22-20020a05640234d6b029038d04376b6asf10801433edc.21
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 00:07:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621580866; cv=pass;
        d=google.com; s=arc-20160816;
        b=vnbdeiEdqSKpKwNL6QpcJVHl2PBVOo6Nf2io9Dmem5e4c3OoUuFIPQ5gL1grymREUH
         rzCvGnSVPwmVnc/ShpAZlcsjL+Viu6pVAKQ5xeLDJNQNqQjYn+W8pbrAAmisOBSz+iHP
         yO1SmK0+SUPTPBHCK6VA6o+gQbTQ4ntHVamH7a5AhCzSxwQ4sd8bNODsGOS5oTGp0ee2
         PXhHa9vdRNYJGEpDhXo8lngrogflwBapt4bC3ynfX5K9WDq4U0fCX17s13WR3Uq+2w8u
         KtWsRtygDG04b4nZ1mb338zIZdSY8xTScaTqG968UjgRMJmCCWyb+T/K7u53R+Mi66rI
         CnKQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=VnkOEyhY3kDagRUbAdCgCb2Aa3m7bfAdmoFQZ4mqVF4=;
        b=p8RdvSGjkDVnE9lNdNGqYYu1IJSRJ1YxCauluX91Fasd3DYEoBJFgr0+5estctiZOf
         UjiQNOOcv88avqpZ1dWlt4pvt59Y3Hq1pEVKCTItcZKs8MhnL58DIGm8O7lxjKDBUDEk
         +wtvIM4cexTu5HFR9beEp5g4gJZSpLgjylENWEyBnG7KbOFsVHPVP1651VLAhPMhT1fe
         3ib75PVjqVvJQcV1GhAjlKYg3G8JOSYK8VO+q6BtbTtGVjVy0kkpJsbfXJIkJKBVHis+
         qsPdkgVcAXCJutTqRUOMZWz0rNre4rjAmgvLNAG1Ny785CR1/Ifoifit6lesFYsSxiFP
         iV8g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=VnkOEyhY3kDagRUbAdCgCb2Aa3m7bfAdmoFQZ4mqVF4=;
        b=kSmYUvhVgRGGKtZx0OBGUex3yOuW2Ie9MkVlEPZQrC529NFGhtEV2sF+nNPkBIwU0u
         DgNciwU9ZcTv+eZVXCBYASqzdstH9dZQqgxb4vG8G2L3wD6h9iwE0jgnsWctXOeol69G
         pLo3vsjRy+orKQUtnbhdwLUWgY3q65IMuhDtTbUzvot7Nn8TxkeiMOGZgoE+pr7/7/cq
         5BiqgAThVTYFvItEVIktzM4X+Se/OezlKfm8E9VN8MCoqL/pFkgbUFs1L5vMmcxlEfFR
         R4SiHeHSidI954lwqVhaOTA+ZU2AUWg95XhyDj5ginUELwl8gHurqW6GyAOvIPQu1/pC
         o4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VnkOEyhY3kDagRUbAdCgCb2Aa3m7bfAdmoFQZ4mqVF4=;
        b=hEVi68Yxi+Z7aY6oJkiR8gu9MB3NNYO51AJHpOWvlcqyC8M/TEx6dqBrM9oy197AXK
         IqqgJmuwWjoWI7wUstnjcd3ospzQeg7mcBzTNrY/yn7jBJha+7EnUV1jvL+DHHEZEW7x
         skw9BAKQCi1/nF8JztluG0VCaOJOgGqvq7FWI78rvjwatMceOLlqoGhorBkzE1RYegKi
         4fkFcofdmjFGH5SF75TX+VCX3IANudAtwhDEczKbuFT3dFCx179dTnFAoMI/QrCpujo3
         s5+1L0qkolic5Vk3+heDxsujqwnY/RDNDroM1EhtthHXDnrQ69nAdIKwOik/99Z53uvA
         h/Lw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5322aMbsxmWl24ioZGnWcXMic1+sjtnVSHHkpLylDgD85Fn2ofbS
	58F2Ihy/nIIJovVjcc+1pBY=
X-Google-Smtp-Source: ABdhPJwW7vMM1d7xqmZO8RFwUKWvyWgJBfbkSXegH9Jya/L4+npOhVKlIfJy46kDPCcMtyK/A3lbAw==
X-Received: by 2002:a17:907:33d4:: with SMTP id zk20mr8784471ejb.330.1621580865924;
        Fri, 21 May 2021 00:07:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:1901:: with SMTP id a1ls2570501eje.0.gmail; Fri, 21
 May 2021 00:07:44 -0700 (PDT)
X-Received: by 2002:a17:906:c211:: with SMTP id d17mr8835344ejz.247.1621580864899;
        Fri, 21 May 2021 00:07:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621580864; cv=none;
        d=google.com; s=arc-20160816;
        b=KuuDtnjKiwoN8kytYoa80F5h2eDY+usb2WnWXsq3dnAOS+byMh/DoKOJIKSRE0K1UE
         4Mc0UBY1eFwA2Q/xAavTNr95fbiIQigMXKlY+DbZ13yr3fWxyO0R1r0NV2TAHqxSmgBo
         ce8733dZEFR8ArVkN+Oa1AydTeg4N+HVHcc4PAMcj+aySEZQ+m2vGGPkjze1VZQsqcsS
         +TSHKDkpskmGIDcB5bZhv9QXez1/4j0Zg6rcUItO2eYrvG9F3P/poMjjPY83IGiIo+4I
         6hdGJRff8cDQ48P3bPwUKnrf+TKA7iQlgEtiQbcdP1smVio39GSShvLq1JlQmBt2Lb5h
         CW4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from;
        bh=buOWOFNh/40PjlJxh29FpWa0liN5vAXoipcpEoHL4xw=;
        b=rgP1cCFlylecQAge8IN6/F9vHNNYtRpkOYirlYm/XeoxiicVqP/Hn0u89MYaG62A+d
         TSehQwPpUA/aH1h/sRhU7d5NG8+fXuTAHAknn2x8AotSZgPlv9T+2mK4VN3mLh2yWpaY
         b4lBnK3DODAazKWRgilEoaSzrnr0fIQqiEhVmsJ1lUt/Hu5eyUOTlMQxOlq4a/8qM2wr
         MO2BHnyUaHZlb3zFduXL0qs3DYOu2Ggiahizk8k4fsJjWpgPoXiQWo1AdeOakZcUkxJ1
         2Kf8rlWrHMKkjvCVl0c6n9OV69BlnYQyhcDvDSg6lfGpeT35szgEwB9iTsafBNLUO8h+
         nAJA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id b25si245282edr.3.2021.05.21.00.07.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 00:07:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 14L77igE007566
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 09:07:44 +0200
Received: from [167.87.240.49] ([167.87.240.49])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14L70PtX020175
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 09:00:25 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] pyjailhouse: sysfs_parser: Make sure to include VGA MMIO
 region
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <5c844f9f-3c61-9c84-3575-c65fc140ff95@siemens.com>
Date: Fri, 21 May 2021 09:00:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

The VGA region may be listed under "VGA Bus 0000:00" for built-in GPUs.
That currently triggers the filtering rule "no empty buses" - which is
actually not true in this case. Make sure we add that region
nevertheless.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 pyjailhouse/sysfs_parser.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index d1de8c79..58910e8d 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -178,7 +178,8 @@ def parse_iomem(pcidevices):
     for r in regions:
         # Filter PCI buses in order to avoid mapping empty ones that might
         # require interception when becoming non-empty.
-        if r.typestr.startswith('PCI Bus'):
+        # Exception: VGA region
+        if r.typestr.startswith('PCI Bus') and r.start != 0xa0000:
             continue
 
         append_r = True
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5c844f9f-3c61-9c84-3575-c65fc140ff95%40siemens.com.
