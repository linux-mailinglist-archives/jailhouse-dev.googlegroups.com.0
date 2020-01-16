Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBFNOQDYQKGQE5N2XTNI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 337A313D56E
	for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 08:56:06 +0100 (CET)
Received: by mail-wr1-x440.google.com with SMTP id u12sf8963471wrt.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jan 2020 23:56:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579161366; cv=pass;
        d=google.com; s=arc-20160816;
        b=Canua/q2xWYM3FAPc+WfOnBAGO0jEJo8naJ6z5mfjwLvasM3nkzULqbioVPWC+m0Yk
         LJkNMoFQfBMGPrbwy2MSvJwaDoeZvBGlDuENaVoWUGy/nGJOeJvFigubdhDSx7IYBC2/
         Rz7n20SFvny+B0jxpabsTZ1WQvVexb58BzVs0yLb0YcZQRaDf9ZDEc8wi+Zo9wNnDNq9
         rppUEup0YiNfq03iv6ZGotk0+rS0zvj93I1NKSFX6oFGf0GNQIJK3ioUeW5BykC/fJq2
         Q5st7RwrWcU3tfR/5moZLRVuf3y2QvVKnPWdPhGsdG/d7XVn9zPidVCMhGRy/TEPLU50
         T3Fg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:cc:to:subject:from:sender:dkim-signature;
        bh=nhFPR+XuMA1xLztmkVgZy7RasRsd21awCS8nwPKcZG0=;
        b=HBQ338/8Zjx8yhZ9eVpeCgeHQph9ZF8XcYyLN6AftyZBhd/WgmFjM0CACg3wv/LdoW
         zGUjj02Qd5SqMtiqTgZ6E4zODccg++39970WgZaU7+qip+moLLYjacQh/EP9J1Hf32ki
         NFkTi+1Y0xQEgcZ8f5f0p1DM86wW54baNiulbi16ow0nUB3zmvMngSXm6UTE00O3a7lm
         gUOcpm59n0L4/YpTz0TEhqH2kA/IYMQFDaIQM8UmRg6HFiFkMCbvxkLVeE1BPSZoUWvk
         /zgYCeC666JpRGpdHrRE13Y5miroFZYKnoojQ2ky9BKag4S4LNQl4LAVDY+KsO9QgP7O
         vE3A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=nhFPR+XuMA1xLztmkVgZy7RasRsd21awCS8nwPKcZG0=;
        b=XfevbVTwA8hvSk9zPjXWXmKX/yVzzTTtC1a9Ya3zcDmVB7y9QEJPhj2i2o1WfgFBdr
         fiVVROwva67qNmR1WmhpZ53ymoI5401nilvGI7Cy8h9/QWxsSzvzZiYiMlvskgEZrvr+
         oQBv1g70sLPW3QZawahVWj/vvr1DHAMHMqEbpNBGnQfaCiBkzCmm/DeK+c4FM4zdDsrL
         poLJaW79n7WfaFYpNP1fBl+vMaQV5MeDX4LGZ31wWq8ep/B6HPWLWdxbju2EUGIP7HmR
         R9IkODJRBu4T2jaoM0j2QCIudem5LJrjkhPW6kNw7qdD9mTNO5r2T9MigB2bciF193pF
         5v7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:cc:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nhFPR+XuMA1xLztmkVgZy7RasRsd21awCS8nwPKcZG0=;
        b=FGEwMuFq2l9GiHTIEzc0Lfe1zgK9rz3of1TEWSduPb3wNH3UZ/kVTMqTHDXSZs6OnF
         fhvftKQlzuqAv9Dx7lDxk6kxRf0sbTAiGUjL1XLo9Hm/q2LOoyYAK0Be3ZTOLtdhUbox
         8c/1iORmxZZabzntCUA9j/ytu7WGttgbA1nLkgoMOLg+AaeP/o7oJ3wP0Elj8sSey6NH
         seNdHxrbLz1Tp+5LFgpO5VI4SlXisls+/lnHOQmI9eBIUc9J8AVFZ7lkEzFZd6twuJc1
         9u4hxt/WFwjPgueJVmPoBdQmCI4WGC4FCjFCRKqymCm0+7ntiJmpf6FFqG6qMoeTmclx
         am3Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU2lu6pSkEUJr1/Cv297GQy2TwNRxbKIGQlC22mX85S+e026rM2
	0TU3BaiE4Q2tdHGD6YcSjvg=
X-Google-Smtp-Source: APXvYqwav3xXw8adEI6dN6BQj7P4XbJ0A1oeJpPds4epx0BtrA6iwKr0M1Lwh/EgPm1svuoMSrwe7w==
X-Received: by 2002:adf:fe07:: with SMTP id n7mr1806605wrr.286.1579161365850;
        Wed, 15 Jan 2020 23:56:05 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:9808:: with SMTP id a8ls852890wme.0.gmail; Wed, 15 Jan
 2020 23:56:05 -0800 (PST)
X-Received: by 2002:a1c:8095:: with SMTP id b143mr4819516wmd.7.1579161365166;
        Wed, 15 Jan 2020 23:56:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579161365; cv=none;
        d=google.com; s=arc-20160816;
        b=DeOcenkoBrRTi33FhN1WusBlPnxiS/DepF6w+eSukceL7xg4CMUCBzj5oo0fVlNKOX
         9/Y0MLFCd5iQczHGrXHP9PuP9ci27xmH0rKkjX+F3L5paqKmbrzlSBdjDgbhPFE6UrkD
         U2yeYUtM49JsBeqeM18HAa+8mrG2edKZb/nluFvaQnHmu1wGja3VYGGX470b3XujIaxb
         78dIaJxEN+K/bnP7Ce2Rq4MdNlawyeeOhjenkgNM/OeUH7e/CbpvrojSuIgJj6/k0aqw
         X/0vkWyyr9MbcR04UTWJ5+zjSdwAHH9LgaS+fM/de4fRrF0KZA2gtnaZjYgUR92FKYKC
         3M8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:cc:to:subject:from;
        bh=6L34CCre62SI62YAZrUVKxcBdGN608J69RyInM+BB/4=;
        b=MvUrblPB1BWM031oeDEBRbLDRcauMsgL2/eb68NroSjn6ad2JSGuEYfxkSJMVsdk2p
         HWy1jhY1COYW7fYcXsYc171OM70GNank2RiIbnvEnz5zASt5bHBMxEzh0ZXEyIUOwK9a
         yavmDlUjYzE7CNRpZIc0fSobLOC0aBM+jEN/OdEWD9TKHmWD4B0wztCQbDNB5yFp/jrX
         q36twv0dLgrZrGYHhJYm6nCaHIw00BFP2r4WH+1REsUQ/D/uEFX/WHTwOdAM3fInXcvp
         51pH78kuYQhGGjOeubFHZyru+PovoMzSDoBAc2Sz68PrZ9w/itiL1El58vUUfIvjpPTJ
         Y8FQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id y185si81078wmd.2.2020.01.15.23.56.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jan 2020 23:56:05 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 00G7u4Ex025845
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Jan 2020 08:56:04 +0100
Received: from [167.87.48.124] ([167.87.48.124])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 00G7u3Tn021502;
	Thu, 16 Jan 2020 08:56:04 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] arm64: Fix initialized return value in
 pvu_iommu_config_commit
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: "Devshatwar, Nikhil" <nikhil.nd@ti.com>
Message-ID: <d898bc14-da2d-7b74-deb1-897ca06f5755@siemens.com>
Date: Thu, 16 Jan 2020 08:56:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

This is relevant in case there are no stream IDs in a cell config. Found
by Coverity.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/ti-pvu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hypervisor/arch/arm64/ti-pvu.c b/hypervisor/arch/arm64/ti-pvu.c
index 39dff875..b06ba843 100644
--- a/hypervisor/arch/arm64/ti-pvu.c
+++ b/hypervisor/arch/arm64/ti-pvu.c
@@ -437,7 +437,7 @@ int pvu_iommu_unmap_memory(struct cell *cell,
 int pvu_iommu_config_commit(struct cell *cell)
 {
 	unsigned int i, virtid;
-	int ret;
+	int ret = 0;
 
 	if (pvu_count == 0 || !cell)
 		return 0;
-- 
2.16.4


-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d898bc14-da2d-7b74-deb1-897ca06f5755%40siemens.com.
