Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBWXG4XUAKGQEYTREYMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 810215B2F1
	for <lists+jailhouse-dev@lfdr.de>; Mon,  1 Jul 2019 04:43:39 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id p3sf2400278ljp.8
        for <lists+jailhouse-dev@lfdr.de>; Sun, 30 Jun 2019 19:43:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561949019; cv=pass;
        d=google.com; s=arc-20160816;
        b=kXbc9HgfA/WKSbUCi3tCWqcLNkC4neBME7+FlYx0gAQJkRMMOs6YZ5H1Ii2xGBnZ71
         wGcL6mDeSz+Cw5d9uq3wEtuZqWGEqW51wixdtFJ3a5sFWv87sOk5Lxi7hocWG+xRqe4y
         iLTmFSQF7RT/uQhev+48XOgmJdWmPuoZiuenK71kNUPohZqJqGsPZY2Pe9X/g8H/4kwL
         ecrNrD8Y6HuTylee1bBSU6ZyFI/9K+3Pm13g7TfeipwhwOGpnVd2XxWUV26c6hUWI3hD
         3t69lQRf36Yo8CdZWQLI7zavYIxpFUnCoEH2xr2ZgSPhm3TS4tBYUKk9+1B++6NDi9Ku
         C0lQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=QIzKygVmvlxj9HoAeO/oPVEwMW/e9SxC8pVYAh6+lH8=;
        b=s78fOO+XnpKA6G22DcLwIaXaf2gKW8xmEkM/CdjdVpfFnAyE+y2QckyoRAmJ1PM9HW
         /yb3PJECcPerpa4lbIYl70V1mwVWapWujOwLycttHuqlsvx9m/Bprns3Krlfc+ooR5Ju
         XqpO5QPIqraGPJ2uU1h1ony2EqpblFKlgf70whrQctlMPKlLnWhK+iGGDq5juUCnipvv
         LxyPUB3fteOeHMQTjm8lurbSq4QJZPw1aajFi6QKSXMZyxfA14Hmp+DrhkCdYe4EZwyE
         BpO4awPjMJHgCufrq0X4HVPDOj3pp+k0UvTGwqudkDr48G2iUN8o8ebgsu60LuFkrYjl
         c4Rw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=YKkepGNN;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=QIzKygVmvlxj9HoAeO/oPVEwMW/e9SxC8pVYAh6+lH8=;
        b=Guc1BbbYmGdm6R6KA3xZBFgY6QKYhv5LrXFIS7WN8b3WE7n8WAMNIKEb6WTl6Vbaxw
         /8/I7l1A4HQce5I7MJs3lMOVoNwZmjhnnj4+/BYPM/GssoQ2oG2H9M3G/hi6uSTFW7L6
         iP5Q1FAwCkDYCl7WRf2BuLPV/mgLjb9MXw0dWI4Hq/Vl+XscoNVCeI16amsgodgjCy6q
         xzL52AzIFDPv4IUQaUppeHeZWqq/3VWzd2T5uF+eAVbR0LF4VArLAzctKhbm0vIqA5ee
         9K6ukIXCT6qeovwDoX6rpLWEBksqjDgXMVdKYUMDiCogijL9GRucQE68r/q9XA+ZEwWp
         59/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=QIzKygVmvlxj9HoAeO/oPVEwMW/e9SxC8pVYAh6+lH8=;
        b=lEVFZ5GTL6UJqM3VAtH4/xO1mt2qZNh8rms/OvxlN6Zga2fuKIA6KL81DQ5BPUpjmU
         wMfPjJ+h8VA++6UnN41ME5IB1n5jAKc8YK8u9EqXxmbdx3ewo41+LLe48I6RPdqwEGvM
         Dke5onMwCSW+abn1UDui7Ab75NOFrstxq7FfACCc/u44hloeLllaGuUh3G1xp+l55VTT
         Ux++XlKrg4I92mxm22ygUGrMA4lBdpfyLIQcC1mMQV7qcnV3pAMv4Ma9LkWDDHMnmtyj
         ck4/ApovHlRS/u9m2K02UC6zgUSWdbnJRNe2cLNWFv0A4qQKnBR6WRbAZN98BGpVB39r
         jFeg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWRlZ1Z66IMRXY376uB7zJBwTwA2aCxH6S/kQvqSYkL0U2/6vGl
	JIqjaOdgu7extVXuu090HK0=
X-Google-Smtp-Source: APXvYqyoD5bA72L+68s7XAclfms7MRademebeLB1YUfz+PZrAZdCIbf8df0jQnKQLSx2X9F7yYzn+Q==
X-Received: by 2002:a2e:86cc:: with SMTP id n12mr12278912ljj.146.1561949019080;
        Sun, 30 Jun 2019 19:43:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c34b:: with SMTP id t72ls604666lff.5.gmail; Sun, 30 Jun
 2019 19:43:38 -0700 (PDT)
X-Received: by 2002:a19:710b:: with SMTP id m11mr10559504lfc.135.1561949018097;
        Sun, 30 Jun 2019 19:43:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561949018; cv=none;
        d=google.com; s=arc-20160816;
        b=hXa8MJgkPKk3VZbOjWu7fhQA/CX1olruM+PR5Rtg6AvlG3Ogxoc9/bf800IJklNit2
         lLCOb0xxF4nzmIp4d1nSbRxCioAWN3sk+br0uheMp3JfhRmgqO16XtJx55cvTqoxE7q4
         FA4jiVLLlugPbTGEE7nu46yfeKvPj8nX5kTFTqjtoTQDEACZzSKdUk/pkOlrcD2LSnOM
         +Apnnty6Gep1dBMQql/a03YUY2dgUyiEEjrwolOFHyC5UVg2ZsN3ImtsALXMsgVbgiuO
         +2iJd0aBRu0j+NGYlDXTF/YLj3NjU3odx2pn/PRgCv0cwlUjnklwVXWuNgij/+7gaxsz
         fxvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=TkGd1IM+MezbeYo867EIlF7v0otyMqCj0CLYgzWUOTw=;
        b=DEffA0oF7PkISg2uC4CgoR0ZNeCR1iKWFO+JvOfm1kOf5GsTMLD7P2/Zi2UknlOWL/
         PnxeeZZIvroV0uSI63TVvSqwwIwyLFmvGN0McHNOLNSNkoOLe0SX1GYTvXpSGIvMz1UE
         5MjFkRbpbIFRnFUz7g7zbC0YsN9a5GwBTSNpvfnNAEoor8n5DC+uEwPfmHVgEGDW2F1H
         v2Le/8M3WKMyAsKOZl00lb9d0LPuY/zg6oYof+ES0qmFC5wB0DgE6wYCWtEUTy7GNjwT
         2HIz6jNHIppFu7kl1f43onEuZc1yP68h1o2pmW10mrfQRfr7vaLzZABrYtdzNX02bQ9N
         kBkQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=YKkepGNN;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id z18si437331lfh.1.2019.06.30.19.43.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 30 Jun 2019 19:43:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 45cWs45ptGzy9t;
	Mon,  1 Jul 2019 04:43:36 +0200 (CEST)
Received: from [IPv6:2003:e9:af4c:2a00:e9d:92ff:fe75:492b]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 1 Jul 2019
 04:43:36 +0200
Subject: Re: [PATCH v2 2/2] pyjailhouse: x86: implement pio_bitmap generator
To: Henning Schild <henning.schild@siemens.com>
CC: Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190620220614.23450-1-andrej.utz@st.oth-regensburg.de>
 <20190620220614.23450-2-andrej.utz@st.oth-regensburg.de>
 <20190628102929.6e801007@md1za8fc.ad001.siemens.net>
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Message-ID: <acbe4ed8-5e5e-dc59-abfd-b2692a0ec6f8@st.oth-regensburg.de>
Date: Mon, 1 Jul 2019 04:43:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190628102929.6e801007@md1za8fc.ad001.siemens.net>
Content-Type: multipart/mixed;
	boundary="------------0A25BD01963C2D9AD7C168A5"
Content-Language: de-CH
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=YKkepGNN;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

--------------0A25BD01963C2D9AD7C168A5
Content-Type: text/plain; charset="UTF-8"

Hello Henning,

On 28/06/2019 10:29, Henning Schild wrote:
> Hey Andrej,
> 
> this feature was already proposed and discussed before, but never
> resulted in patches getting merged.
> 
> https://groups.google.com/d/topic/jailhouse-dev/BSfMKio91BQ/discussion
> 
> I did not look into it yet. But you might want to reread that thread,
> making sure your proposal covers what was discussed back than.

Thanks for the hint, I didn't really search for previous attempts.
I see now that I forgot the PEP8 formatting, will note for v3.

> The main issue really is that a lot of device drivers do not register
> themselfs as port-users, so we can not detect them.
> But those exotic ports are probably blocked in the default config so
> there is no new problem. A new problem would be if the generated configs
> shrink the default set, revoking access that was granted before.
> But i agree that it is a good idea to improve the generated config to
> reach a working out-of-the-box state.

That was my goal: old static port list and new generated ones must be
functionally the same. Access control for rest of devices is in the
hands of user, as it was before, only more handier now.

As for device detection: work is still underway.

Andrej

> 
> Henning
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/acbe4ed8-5e5e-dc59-abfd-b2692a0ec6f8%40st.oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.

--------------0A25BD01963C2D9AD7C168A5
Content-Type: application/pgp-keys; name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

mQENBFxzFpQBCAC6XSywR2EDBbFNBR506ej2J3SEzJkyqAo3MOExNugqTS12AkSb
gbrc5TGBcE1ajOyPGlCfoKlj10ZaLKlCXP5Mifdz4CmwY4IFcJrRP4SlJ7VNbPkd
fjQXEhMOozJGePJaVcz0FIDQo/oQNj98dvEyXPBriAW8g4ETFfxSYR3wReSYzeHB
UWK90eBk9eSWifafvJ6/XDTsP8ePmktCwrkjQyePK8a60F6FTSWT5gTKPZRAg55M
bKnhvrjYHA4/onQUT0QDyGKGqtm/ZoVSx918YBdplWER59Jfx+4lZiulLfZ2kO01
IPyIRHLArszvc8AJHJ2osD8qkcFCfWQgo1IJABEBAAG0LEFuZHJlaiBVdHogPGFu
ZHJlai51dHpAc3Qub3RoLXJlZ2Vuc2J1cmcuZGU+iQFUBBMBCAA+FiEEcva7ETyy
nZ2Tux7aHfd352GXgt4FAlxzFpUCGwMFCQHhM4AFCwkIBwIGFQoJCAsCBBYCAwEC
HgECF4AACgkQHfd352GXgt4bXggAhov2p0LFiCJ79W+bfjm3izqlgSEFGeiTatAf
WyLdF6a+q66XFQfr9zxRiP/yXqEjhePsyxMuKM03joiKD8FVMzVyBQ19oDV7Ss1q
HNzs2tY6LjnQEm8V/lQFP6dzDCYJDpBWZ6vcJkD4d21IGRaNC0qkxKz9qqyURfHn
KJ/GsUSMDXD8nSnLU1HLy1LYUhoe/ugtbXUYrUJ8t3lbuXWZQl3fPA4mTgwxrdfL
RMFxrNeULImqHrc2Qpufm7d/K2FsbBmPxgS6rBpAOU1CWdLTNBRGH/Q4KPqNmB2q
3ispXsQDDi46Qa7weqtvEdICW4UkK8NqGJbA0c0KpSprBDUjeLkBDQRccxaUAQgA
x4gaBEt7mlvd3Mtdtm1MW3K9fFrLE8ociXmC1uUYP3TYqZl/wWGN7yhZuoAcsgRo
Px6/uWnDUOpGXrij2iSlijRbG/FCgd48AMMXbmbXOEFgPMjT5wzEmbw/YualD8wh
zBtbsYg9mHgu98NN56/KAlRAdZSdNpT+8LOp/XXqATHveMLPktWRD1dC5JMQNP3U
D4wp8Ow237uqu8IQiMeF35MhzJ/IyoxpwSXtZgzKY21RrEc41jkY4eSt49kH04Zh
tOuc2wW4SfuFua4eWpcicPMaUBG18Qj+LlBa7mrvGOODraoxyimVX0OPdlbTT1YQ
cvz1RttrPr/Gu3so84Wi+QARAQABiQE8BBgBCAAmFiEEcva7ETyynZ2Tux7aHfd3
52GXgt4FAlxzFpQCGwwFCQHhM4AACgkQHfd352GXgt4rZwf/VZg8r/DSSl6AmbzD
FYDv6dRRtYTOFfl7M0cln2Ov/7kopSlEdBGemEUiB4Hv+fn5LWTkxaroEufswAkZ
JOcYVpovNb0B4Cd0r+7np4CpU2WM9S5WgSWPjyRUpsXYgExdOEci7NDGYVzqeA27
5Drm9F+vc8haiSFabIz3dkmdXuwIQtgcWJGsqrXpxAy6r7rJysJ+370qCFFth61y
lw4jMbEWMW3zVkO/85jDo8T326/tm62ctOjcYroYiOwYdF1UWHPsVLYqMS4cuSYa
1XFN8yos8kAZTNMJrAr+Ie/QEoQhBSw0KAKgKz4dOHgQUqgDQqOweTCsafO2AG7M
X+r7pA=3D=3D
=3DdxnB
-----END PGP PUBLIC KEY BLOCK-----

--------------0A25BD01963C2D9AD7C168A5--
