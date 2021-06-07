Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBQ677GCQMGQE5Q7PA4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x137.google.com (mail-il1-x137.google.com [IPv6:2607:f8b0:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B1339E746
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Jun 2021 21:13:08 +0200 (CEST)
Received: by mail-il1-x137.google.com with SMTP id g13-20020a056e020d0db02901e28b9a6ae8sf13289867ilj.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Jun 2021 12:13:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623093187; cv=pass;
        d=google.com; s=arc-20160816;
        b=hmrx7PXXJKMhUfFb0JYAVtnSPpacNABzP/PLLPbv8L4Oih5ck03Nd+c7+POPE2ts75
         R6bBXLn1VxnFubLMo2lq1Jrpn00/o7u9wjxVySq1MG6oxKdJIfD7uV7Pjsi7hDdfZM1p
         ESBjwl5qpcU6MVuj95AjfF5gj7wurO885XchodUdcuBqgpoRQOav6SpnQ2AHIU5m4dxF
         mRpPzwcHXFZLO/W2Nnh6iQUgEYa84BZBby6RnDK5yRQE25bXF0D1AQkf2wiBy98cHBK0
         l5Y8LAl50wOjWrgzNGW38RPajuHlHDhz5ZLUk7mbAE/vla5pFfgG9/X5gRmiwrb85E+B
         JHHw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=LXs292x5dNz4DyVCp/izhNINi/wt/GdCY/ymBIOgNvk=;
        b=IW1m9xP6SGIKhnevCvsX4cHJXafky9Te1S7DYmQnBY96wIwe6SuFP1GmKyH2DsNox4
         dQ1W2rA90PMP3lP+KNDuyn8aQWWTvJbVXPI9jEI3BHsETYQO1AH+prpyVkcwxY9LMZvC
         IpMwJpf2kUpXLSr5NfEjhaeh4sqrSimhYOzuz+LYpxR7+q8YMcW6zfKR7NVL9VRtFpzz
         TqhCwRefGIOXNhQux5gIOrke8DE6tsIHroqRhxaF58sfhmzjr2lpGn7MOvzcpCmalzdG
         eId1YTrM/o9zFTl2juDGvE2Iafyf6zMSMbvhzEPOurK19lyHKwNBVSddbG0nOjFZwd87
         PnnQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LXs292x5dNz4DyVCp/izhNINi/wt/GdCY/ymBIOgNvk=;
        b=GllOt+GVcQNLNoGYFR1kxEcteIpN8/w6fByjwSbi9HgEkrP2JszK8VUb85egCB1FXd
         3bPcwvO47TJDj3OlmG1f54/vGkv6xIOPt1+kHfDfp3dLZzzH4/prvYSmHMJhwpN0vKn1
         6oaAVZoue6mgjMhKCe5l1UpbxOX6VTZOND2EWQnWcJkXIoD4QG3xnInU4zpkZTX3hThH
         08nOTLrhM8y5KqWsHdb03hurI3+sJGSKszGUI9hI8Kf4E8Y8cPAc3SKMWLXfifBn5iY+
         A1VOr5r8MyDPYLvATcP8oS/u5HKaE0nLPa9Jsbwo3d6EcKjFAwZtKoJYebfbGoORIvoL
         Pa8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LXs292x5dNz4DyVCp/izhNINi/wt/GdCY/ymBIOgNvk=;
        b=TFyrzWxubd4ZE/x962fVowANwIYx5birWYV/tjOT1vV9CihmZ98aXhFilXVOvxC7Jc
         6a0jgQ5tKy++S3zult6yw68b/HjN/0LPdEM+KVgVTZglR9JTu3byTruN7HqT14oitwPn
         6W7Gqv2t0LMJ7gwjUrT8Zs8T3BraXdABvC9EoGex2ZDL37asjFalpRHjK3XJtW2xBn+N
         1EKT7iIG1CoPdXICLLwFiJPxqSNJ7dM2G8vFkxXNnqmxbz2okxAFMG47r+lfImPuUFBb
         pMcSyB5FT8n3heDlViNLm0HwUvJzInfOaqCJAFjmWwlXhuEEuXHlBIyRJ9Sf9tvz5e8k
         58qQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532J9FY9TdQB1R/D9J1FyG8KfrQ5VubBMoWEhPaSlwyhyaVjqppe
	cu6sR/gQpIzppPhhXXT4/8Y=
X-Google-Smtp-Source: ABdhPJwJw2wrU+rTixg5D4cDy3LbeMHbZ/I1WcWcbD0PmnWnEkm0iyfW6gQoU+QMVhjLnna6HnaZXg==
X-Received: by 2002:a02:5b45:: with SMTP id g66mr17833229jab.62.1623093187338;
        Mon, 07 Jun 2021 12:13:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a92:c606:: with SMTP id p6ls4219782ilm.9.gmail; Mon, 07 Jun
 2021 12:13:07 -0700 (PDT)
X-Received: by 2002:a05:6e02:1e06:: with SMTP id g6mr16202446ila.192.1623093186932;
        Mon, 07 Jun 2021 12:13:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623093186; cv=none;
        d=google.com; s=arc-20160816;
        b=QCaXqNt7waNY4Rq29dwt+aKKtVUkoPbmN3JLdvthuXmKVP+b8jifMrvzk8rCAgi+ul
         e96fhWaPX1ekfCKOaN7tCm5QSjmagI8QrgjmnN7S7tdmW3YtU6hnKN8FaUrP3lqMMuNs
         DRQKnH5CvApI7iM0qxNvvwrdAl3buQxZPUM4xWQ3MU11SigILu6IXRPZsfHXcek4SMFg
         xW1SbqK70lv/6X1xZlaA/ZYedv+PY5zbUMxQeGolglbn7lQF9dfwLOOUCS5TrBhSzN4P
         wCHefQprmpxVN12Ujr5OfyFT9mO4wfDo+4aSaV6M7lbqDYWmLaRO+WdbgcS4R+tp4SVz
         mAZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=1AR8oDsOmBUQkiTcvO0XNSWoUfQEBQA4N7Ho/sE4meM=;
        b=YhtN81FofM0G8yy9wFSNx0MXONyBPNFUU63PGei51VByaMuOMjo3qUNEoY1SBCkdRV
         jnHdwAflutooaE3ZJdw1ka8qr0xKVW0nXJgqbTshl2L0f6fkOtV7NjLOcJy1cnf9GiFD
         6/UGXdigrVhwtM3sXGSkrLfCkhPZb5oTKWudaKEYxfwNGyVWIQRPka6sG5y8topy97NF
         ZyR4bHs/ZYoyHrYWaVsvXu/vNiLIWsjR8yXtDwtIzvaR7LJGMzSWT8MLS2t+QXPzNhPt
         /i+M4rcehwHvTYNCH1bw4vbz74gxK8xRxi+U2pu1Dl5h0WnGCjucIe7un6Qaxt+UALCw
         ZrKg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id x13si1890191ilg.2.2021.06.07.12.13.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Jun 2021 12:13:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 157JD4ix014908
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 7 Jun 2021 21:13:05 +0200
Received: from md1za8fc.ad001.siemens.net ([167.87.38.117])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 157JD4WA015519;
	Mon, 7 Jun 2021 21:13:04 +0200
Date: Mon, 7 Jun 2021 21:13:03 +0200
From: Henning Schild <henning.schild@siemens.com>
To: <jailhouse-dev@googlegroups.com>
Cc: Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: Re: [PATCH] customizations: include wildcard into SRC_URI
Message-ID: <20210607211303.708ad0c3@md1za8fc.ad001.siemens.net>
In-Reply-To: <20210607180741.12416-1-henning.schild@siemens.com>
References: <20210607180741.12416-1-henning.schild@siemens.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=henning.schild@siemens.com;       dmarc=pass
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

[jh-images]

passed a test where i did build qemu-amd64.

and another one where i integrated into a project as a layer, where
that warning disappeared

"WARNING:
/work/jailhouse-images/recipes-core/customizations/customizations.bb:
Unable to get checksum for customizations-siemens-ipc427e SRC_URI entry
.bash_history-siemens-ipc427e: file could not be found"

Henning

Am Mon, 7 Jun 2021 20:07:41 +0200
schrieb Henning Schild <henning.schild@siemens.com>:

> That kind of tells bitbake that the file is "optional" and it will not
> warn about it missing when parsing the recipes. It would find it
> missing in the install task.
> 
> That allows re-using jailhouse-images in projects that do not even
> install the customizations package and would receive warnings when not
> having a config for the package and their machine.
> 
> Signed-off-by: Henning Schild <henning.schild@siemens.com>
> ---
>  recipes-core/customizations/customizations.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-core/customizations/customizations.bb
> b/recipes-core/customizations/customizations.bb index
> f71a07887bed..c3a1fde01822 100644 ---
> a/recipes-core/customizations/customizations.bb +++
> b/recipes-core/customizations/customizations.bb @@ -20,7 +20,7 @@
> DESCRIPTION = "demo image customizations" 
>  SRC_URI = " \
>      file://postinst \
> -    file://.bash_history-${MACHINE} \
> +    file://.bash_history* \
>      file://e1000e-intx.conf \
>      file://ethernet \
>      file://ivshmem-net \

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210607211303.708ad0c3%40md1za8fc.ad001.siemens.net.
