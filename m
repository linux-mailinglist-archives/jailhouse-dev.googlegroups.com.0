Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRB2XPY2AAMGQEFI3DWSI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 820D930639F
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Jan 2021 19:58:51 +0100 (CET)
Received: by mail-lj1-x23a.google.com with SMTP id b14sf134688ljf.22
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Jan 2021 10:58:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611773931; cv=pass;
        d=google.com; s=arc-20160816;
        b=Dhi9PUmtQGx9ZTIvpCh1r8lUQSloRqKd0wZnkoAzQFQZ2j6aZ6ff3B71KYRrkWoVcX
         gIl97kcDlkzL+6dz79HnpfMRTzjSQ41ZDtnPDpsG5uOrkG0tcv1TXsZl11NuXqgi8LA1
         1kWxcOxCL65kpd/MW45kHZWIZvEifEj/d4puOnYS0iKWNcBxCxneCrUozc2pdrignbdq
         0ircwSgNgIY1fHgglqexmzgHEZQlbrm43jZQ0MQNGpnEG9yxbSccaErHEreFe16w9QYl
         MlYYieBKMiLfAqaolKACqNtw/wKHoMB1qUEYWM3Pv6zMGMYMvrDj1BLAneHt99pbNLuk
         eFpA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=pCMqV16bjbmMBlSLHD3ZSThSFfFx8z7ZPYPFgSz9lEY=;
        b=RtIGE5CNwbwCUZhuuooDnSQ0bjDKp5MhLcg8m0JMJSPbkRDuS3A7ZWE1ipKsgMd9OW
         x8JwqdGx/D56yuFaI+X9JT9HsnUvaakoyvkzzgTeup15ASs8pOoBZzRSj8vuSaDfFQEk
         54/VHih+ZEZ4qcOZF6h0wdYKORQ7m0xP8ULfnCm43C3ByHYvZQyrS7KUwSTn1vJpba8f
         /Lgl5j8kcGBA+vgD5ItNDCcVdE0wNNA/62Vua+mcuE67b5nTyfxxWkwgRcHQm92JFyUi
         cEPtTWdzMNXzdbyIbRcfU0Y559pOVBA0wHfFNSMIeUgotMjgNb89rCQpMS5YXkC/QR1y
         95jw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pCMqV16bjbmMBlSLHD3ZSThSFfFx8z7ZPYPFgSz9lEY=;
        b=YPwcoHNgsC2F8hydcltImRAQzQNvcOd2b/G2NOdogMdYcE5YaScMRZxsPDCDCpMACu
         V3f6yhzBOXC6TBMi5LoUj4NoNYKW+6hwjqxIo0bnbR0WNpkVThtfS69saHcJM35jMuZv
         5SzB8q7qZ1k0wvWnBt0W9eCCA2kmCdUx7L/I8AyirOSu5ZNffSZPvKz1EW4pkw4OUB82
         I7fFVvT2fRIuRG1MBhK8jrd89O2M8zS904Fl6yapz7yr+qQ0zIk4+a7pxPCtOAM7VFR0
         P0gr4B0tQ7a6fBfIAJCwnV0xokNF6WVpvUeycNTfVZB6621+z1h/YgNFahyX84euQrrC
         ovdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pCMqV16bjbmMBlSLHD3ZSThSFfFx8z7ZPYPFgSz9lEY=;
        b=eA3RrPX3zgoFnEBl85EfbOlpQnA40qWidG/NUieWRfPWxt8YQNgEYCZLs75gE/BH5M
         vqcQOitQKceGfrNVXb0CNOQB8XlyBMEqtf8Tadg5H9lmEStpAPxRy6AZDrDCd5X6g8Ba
         9H2cvcHfH/EDiw8AtWYxyZtcEbZM6b6xDb2RLugoAdE4zjRXt0J6bZw/RolJKbURDaJn
         yXw9iMALgRkn05H1cqFe1iCeG+XyerOqmNubx9/sqmNDxeiRroeXhns6P9ovcQgexq1s
         KcspbiF+a90eqAwNMDjBNSKHtiCgUqoSHPvL3ZOCu1c0uM/GAoTAJcki9mn1MnEG5mqf
         CGaQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533N0FTZc0LAXmhPAvG0Qi72/1tAiVfcPbzGwIDZ13q0BlSoEFc1
	lvx7W+hK5eY2dBU6dnd0OeQ=
X-Google-Smtp-Source: ABdhPJzMOxerE565DGam/M8oqTpJiYmF/GmJCvcKlUmm9fLlSIMRNVIvhBJ0drA1EsZrFmpZQLC2XQ==
X-Received: by 2002:a19:5208:: with SMTP id m8mr5385775lfb.531.1611773930990;
        Wed, 27 Jan 2021 10:58:50 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7d0d:: with SMTP id y13ls558818ljc.9.gmail; Wed, 27 Jan
 2021 10:58:49 -0800 (PST)
X-Received: by 2002:a2e:86d0:: with SMTP id n16mr6492318ljj.51.1611773929789;
        Wed, 27 Jan 2021 10:58:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611773929; cv=none;
        d=google.com; s=arc-20160816;
        b=UZi1DTC8Dh9QO+njH3DRp+cPQgRRGnSL53HSvptlzz+XdH79ZBKRCqntYytI8hlZua
         SkE/0GzaEPU3Yp+2fZNtEco/7F0mr/joEXmWP/tLhmSv4PYE1W2yaX59+PAt8K+4zpJw
         UJt/b1ynRoaUV+kndRN69V3UTIbZX6DeIJP2lPywUf8Kd5VJRI3nDPfWt1DJeAvSRnSd
         XkFu4LEfAWrYZSilyyNwhK+KWOcGYHfdkLVojkQ59YgMmNxorQayU1DmfrCOJqtpM3PL
         c8Udtz/rX9MiqNYHMTpA6tLZ6gM7afeLdke8hjJatMZutjyul2LXoQ8/RLCz1ZbWcUEt
         5oaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=1XuNopJHTpQmfP1Xg+/zmnOfPd4hiOe2fQurPtgmQm0=;
        b=wlbiQgv3V8pRxAGsPayJKSMipv7lA3pvlp9UGz1z7jSq6MwVmQ9JGv6jBs+090ZCWW
         pzznWzS7SXvO33gps/vMgvAwi1GaTU0CUGqA/rDedtfkUlOXRC8kVGP/iRxR4IknzpF1
         38VntOdzclAzK94JIvezGJ8Eo+z7/WqK8ibqWbHE2IbFS/i7J0TIdUtTw/Ecz/izDmDy
         I26fAm9O0GfoT76r88z/3pXYjBxUaWs3h/RoRXXdCnWjlEXa9wFcaTIg25soScT+urLX
         JFVXS0njyyyTEcn00gO+5nWo1lsUsbVrDpgmeK+UKIANfa8pO2Y7BSJci44oRa3eJIPz
         3q3w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id u7si165095lfg.2.2021.01.27.10.58.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Jan 2021 10:58:48 -0800 (PST)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 10RIwkSl015735
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 Jan 2021 19:58:46 +0100
Received: from md1za8fc.ad001.siemens.net ([139.22.115.74])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 10RIwkLx031449;
	Wed, 27 Jan 2021 19:58:46 +0100
Date: Wed, 27 Jan 2021 19:58:45 +0100
From: Henning Schild <henning.schild@siemens.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        Jan
 Kiszka <jan.kiszka@siemens.com>, Alice Guo <alice.guo@nxp.com>
Subject: Re: ivshmem-net issue
Message-ID: <20210127195845.348673a3@md1za8fc.ad001.siemens.net>
In-Reply-To: <DB6PR0402MB2760C0BAFC4117D229FDD5E888BB0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <DB6PR0402MB2760C0BAFC4117D229FDD5E888BB0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as
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

On Wed, 27 Jan 2021 09:08:28 +0000
Peng Fan <peng.fan@nxp.com> wrote:

> Hi Jan,
> 
> When booting inmate Linux, I have ivshmem-net configured. In root
> cell it shows as eth2.
> 
> I monitor system network, and see eth2 is assigned a random address.

This is not "random", this is where some dhcp-clients end up when they
do not receive an answer to their requests. It is a fallback when there
is no proper DHCP server and machines still want to gain an address to
potentially communicate. (zeroconf APIPA)

So it is worth checking the DHCP server to see why it did not hand out
an IP. Maybe because of the random MAC that Jan talked about. Or maybe
that MAC was taken and the client did not have a valid lease for it.

Henning

> [ADDR]4: eth2    inet 169.254.232.89/16 brd 169.254.255.255 scope
> global eth2 valid_lft forever preferred_lft forever
> [ROUTE]local 169.254.232.89 dev eth2 table local proto kernel scope
> host src 169.254.232.89 [ROUTE]broadcast 169.254.255.255 dev eth2
> table local proto kernel scope link src 169.254.232.89
> [ROUTE]169.254.0.0/16 dev eth2 proto kernel scope link src
> 169.254.232.89 [ROUTE]broadcast 169.254.0.0 dev eth2 table local
> proto kernel scope link src 169.254.232.89 [ROUTE]default dev eth2
> scope link
> 
> 
> And also in route table, it added two entries going through eth2, I
> not understand why it will add one entry that default use eth2 with
> gateway 0.0.0.0 #route
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref
> Use Iface default         0.0.0.0         0.0.0.0         U     0
>  0        0 eth2 default         _gateway        0.0.0.0         UG
>  0      0        0 eth1 10.193.102.0    0.0.0.0         255.255.255.0
>   U     0      0        0 eth1 169.254.0.0     0.0.0.0
> 255.255.0.0     U     0      0        0 eth2
> 
> It added the eth2 route table and will break nfsroot if we using
> 10.193.108.x for nfsroot server, because it will match the 1st entry.
> 
> This is not jailhouse hypervisor issue, I just not sure the eth2
> behavior, it is systemd does that route change or we need look into
> ivshmem-net to avoid update route table when creating eth2?
> 
> Thanks,
> Peng.
> 
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210127195845.348673a3%40md1za8fc.ad001.siemens.net.
