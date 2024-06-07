Return-Path: <jailhouse-dev+bncBCVZDQ5D3IBBBFFLRKZQMGQEQFGUTGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3a.google.com (mail-yb1-xb3a.google.com [IPv6:2607:f8b0:4864:20::b3a])
	by mail.lfdr.de (Postfix) with ESMTPS id 468308FFB2B
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2024 07:07:34 +0200 (CEST)
Received: by mail-yb1-xb3a.google.com with SMTP id 3f1490d57ef6-dfa7a8147c3sf2744204276.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Jun 2024 22:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717736853; x=1718341653; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SHWmleSPsrR9VPuCeBp8N9IYvPF+4xTNBeryVka8s4=;
        b=VDKDkN19yiVBwydatXAPl4+o5ymEURh5YqkXstOQThgq579ApAxTreTw8vUjkHs0qX
         A4v9XTDdry0gC3N8jNiJQkPfl3grOzsWByPj/zfu5uRDAXrIe2XFMtgkK3LlnX9qCwX/
         1CDhOar6OuJSvdqzMzcaYQdgUqRXTxy1RE5fdpeM8CrBTFI5o8Q1w+KPZNbhxurXBZxw
         dYu3k8KbqZJC6Y6/vNpq5Ci1UPpuFZi+yiodeCeCighldF3JIE0Wfhmd6DFHsDLz3g6J
         ZQo1d7HfbHu4pUQ/EeQwpFqzLhl4gAiltReCjJHg7AWYfoIicaMPo5SqC9GXhcWd/DUy
         1+ZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717736853; x=1718341653; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7SHWmleSPsrR9VPuCeBp8N9IYvPF+4xTNBeryVka8s4=;
        b=hLLYTjbq4mohotBcdnhG9gjenWzSlwHsnhRQOb2ScuZYI8g09XBGbxuZxARao8CRqS
         CbMcUs2/CiE0t3/RzP79kIxJTnKJ5oeeBtJctQpJyWVOcnbkej9BlbvWcs/S7SNN4CSa
         CuExDpqEvmo2dV18Q+b5K9iMFH+cSVAWPefPJ9O+028OQUNvtvkumFJNJe64lg7ocJTv
         GXQrTaBFP90wQ1/xPvbxeq55OBvCb1Mm5/OY98KgegEqUnJpD9BRodrbQZRt+LUZGk51
         qC+f0symOz5ySd1g41E3ups0CQknRiAuRdB+tKCYPXtR36EIplVhoumGzJIn7Lkq3EAe
         LlbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717736853; x=1718341653;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SHWmleSPsrR9VPuCeBp8N9IYvPF+4xTNBeryVka8s4=;
        b=SuSiGkW76FVMkke+ZLTb3fokYdw7dujjHRtF2bBlEJJ0LD6wphfD5tHQL8hlb2DTm7
         ccV/sbG0rMHeJSOkyAaEAjKs8nc+bXAtUL6u4eMB6qBvnUDbaHKW+sG/pEuts19rR8if
         xo74skNprQvvVsGWjTjMZ2wI4e9M3rQWgxT0C1U3GV1Xaa8aQWudeKZwyRon0wEsq2Pq
         UYqgsc/jxTaQ/dqHNHCcQT5YmxG29sKrz8eI2+OYk94E08SEvAKCA9uR4rh1gldH7C2D
         xl9G258OqgPnW9RSFgpqr6VNhW4bRa1/wwwHCImj6WLqW1whlFr4Kxicb/DnmdRaOpoV
         9VKw==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCXjwmP07/1y4Kixn0sMxokl5T2ZJiqw7MEgdwUDi7cKJZWGBnV1TnQp+KVmMOuipSvLoG7QmFDjCaLKCL80xbyBtAzvOr5PHmgvlcs=
X-Gm-Message-State: AOJu0YxuRfgqp7UIAZwW9gGTTAp7hJHoB5GnTIyfyPhjB1ONfrU4C4jY
	okpFyERAnHuRhtuKfdZlI6GBpN7URzR9e+b48ee7L5TdizOjj8v+
X-Google-Smtp-Source: AGHT+IE7+a/2hQxhoARiPNyhPvp1Mb/LRsx03ASwPzGLJX8DvB8WmozKJIWVLEQJltN4UPqHsSoTiw==
X-Received: by 2002:a25:8306:0:b0:df4:dd95:cc87 with SMTP id 3f1490d57ef6-dfaf65b2011mr1499245276.10.1717736853252;
        Thu, 06 Jun 2024 22:07:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:d6c4:0:b0:dfa:7e23:93a1 with SMTP id 3f1490d57ef6-dfaf12488afls534479276.0.-pod-prod-06-us;
 Thu, 06 Jun 2024 22:07:32 -0700 (PDT)
X-Received: by 2002:a05:690c:6101:b0:62c:67f4:507 with SMTP id 00721157ae682-62cd5663ca3mr3706917b3.7.1717736851947;
        Thu, 06 Jun 2024 22:07:31 -0700 (PDT)
Date: Thu, 6 Jun 2024 22:07:31 -0700 (PDT)
From: Harry Conor <harryconor237@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <94554130-b1e4-4204-b501-5f52825e481bn@googlegroups.com>
Subject: Buy shroom bars
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_53155_1357697339.1717736851226"
X-Original-Sender: harryconor237@gmail.com
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

------=_Part_53155_1357697339.1717736851226
Content-Type: multipart/alternative; 
	boundary="----=_Part_53156_1241448601.1717736851226"

------=_Part_53156_1241448601.1717736851226
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Buy your psychedelic products fast and safe delivery=20
https://t.me/highlandview=20
https://t.me/highlandview=20

> =E2=9C=94US-US Delivery=20
> =E2=9C=94Fast Shipping=20
> =E2=9C=94Secure Payment Options=20
> =E2=9C=94100% Satisfaction Guaranteed=20
> =E2=9C=943 Days Refund Policy=20
> =E2=9C=94100% Money-Back if any issue with the product=20
> =E2=9C=94Shipping Service: Express/Standard/Economy=20
> =E2=9C=94Estimated Delivery Time: Express & 3-5 Days=20
> =E2=9C=94Discounts: Get up to 20% off=20

https://t.me/highlandview=20
https://t.me/highlandview=20
https://t.me/highlandview=20
https://t.me/highlandview

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/94554130-b1e4-4204-b501-5f52825e481bn%40googlegroups.com.

------=_Part_53156_1241448601.1717736851226
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Buy your psychedelic products fast and safe delivery <br />https://t.me/hig=
hlandview <br />https://t.me/highlandview <br /><br />&gt; =E2=9C=94US-US D=
elivery <br />&gt; =E2=9C=94Fast Shipping <br />&gt; =E2=9C=94Secure Paymen=
t Options <br />&gt; =E2=9C=94100% Satisfaction Guaranteed <br />&gt; =E2=
=9C=943 Days Refund Policy <br />&gt; =E2=9C=94100% Money-Back if any issue=
 with the product <br />&gt; =E2=9C=94Shipping Service: Express/Standard/Ec=
onomy <br />&gt; =E2=9C=94Estimated Delivery Time: Express &amp; 3-5 Days <=
br />&gt; =E2=9C=94Discounts: Get up to 20% off <br /><br />https://t.me/hi=
ghlandview <br />https://t.me/highlandview <br />https://t.me/highlandview =
<br />https://t.me/highlandview<br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/94554130-b1e4-4204-b501-5f52825e481bn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/94554130-b1e4-4204-b501-5f52825e481bn%40googlegroups.co=
m</a>.<br />

------=_Part_53156_1241448601.1717736851226--

------=_Part_53155_1357697339.1717736851226--
