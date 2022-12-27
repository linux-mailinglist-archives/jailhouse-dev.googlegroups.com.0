Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBNURVOOQMGQEN2XRS7Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A224656974
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Dec 2022 11:28:07 +0100 (CET)
Received: by mail-wm1-x33b.google.com with SMTP id j1-20020a05600c1c0100b003d99070f529sf61586wms.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Dec 2022 02:28:07 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1672136887; cv=pass;
        d=google.com; s=arc-20160816;
        b=0+iNrkCbh3H3/B3YLxy6kMgHo/DH8T6ngyy0ysI9XkRiSyQzsFVH2iJSjsR3zYhyxG
         21HskbcG7TLBURHLWuAmV04fgloH93pQmB35TFn3ckWmU/hr4Wm6zhr47/b3F/V8mdfb
         QVAFjNiUbro0lxQi9SrRmRpot1pGgH5LtA7Z998497to++SD1Ao696MRNKOnIIOh7Z5a
         MNnJdhacDVZu27J7nS1VJXr/PozdY6N01wwkNzlt/fYd4BJ4gO99IvgolcX0xFHGB7go
         vKsElNib/Lss5FPKBEEFaBQeOfpUN2rycCN86CDjkGhioEQ7+7+j32m5v14Gqnewxuq1
         YOpA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=SPUsRmW5X3NJh3zplBAbHN67zdFne/4SAiYHnreE6NM=;
        b=wLWTMLjC6rllBIOHsQANoUxscTKZHbgf45r9gVQr44aZlTVWLOMYbDAQHIZQbEAOe0
         cWiT5ft6QFVPbpgsS7QZ+hayX9hGrxv6gX59vE52DGG5Ki7ifWY1fZ459lx2/u+x2RLT
         ufKMzgJ1If+0W8cQWhTist6Zwki0+I6rOe5LtvWvZ8gb3giBtgCaRyQMBfuTzOYvM0Ia
         z7tM3YyTX3ZS7XWLABV+NWQKhqFKVGdaR9l2sDoylhBX3JDNu7osG0lh0+pcHkQSkcNR
         QmnQAyTS69reHIBmmaqfdzKtcmlJPHeK5N8vppt7+Z21mRsCaw2TpRboq2oYiLKaeA9x
         IbkQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=bWWvBaFa;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=SPUsRmW5X3NJh3zplBAbHN67zdFne/4SAiYHnreE6NM=;
        b=j3I1zwfCpeDoHexCn6RT/DlLol6nAOHz5qPZp/x+agoXuiq9rHki2xhIAvCdXDTKRQ
         pcV/AOSwB7IN73i8or3nfP1TiXyI8esVlJEfe+SAFUWAHtmaF+R2oT8+2UqQAsHpWRnj
         gY9nOcIBKPjVdLNxlaty7L6g5/CtXc5BLgVjXXPkW+epVBt7as3dRvrY0qyiZPw2WG5H
         akUU6xyMkx6h5IB8FPlneB8LfFsWxeHfjABxJ2xVY85cCpvXQEFJ/Mdtlf6N9HUIS6Zh
         Map0XNNfEH1zweGGwsPYNl9H14hVGFrYqPhAmcWQGudbfAaM4RFujETHNz3E2z54ycgL
         XH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPUsRmW5X3NJh3zplBAbHN67zdFne/4SAiYHnreE6NM=;
        b=wEL+x3bDmcUiRCEqh9IsZJ3kLBKwlXs1yBxLaXw7K99YytKAj9fl+ensfxBo1or+Ix
         nz3lt3M8mn0PLFCg7EDy27IMXYwl/noSg55MjjTqBuHcZaHgXaJd+6vcDqOt7WQWXpQv
         r/lEBN8a9iHXeRlaul3i8cF8Aw94j8IfUMTNTl0NVWw024bZdmCFAON83yvzUUv51ppj
         9jgBVsrmCdqvF88AVcEFk0pdwt830Az0mreTVGzwI7txOM68Vk8EZDF5GxA5NtN/zb8+
         OOLbJhtnxF8Ueekq2Ba5lNmRt6oiux6Q4xsgiTcdA1d1FrfAQeuMb2rB0SO70soBVRHa
         zC3w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2koaFRa/MZuW54ctti9EFuOOqk9qd1flqPzvCZNA7YvwNfD8m2ls
	IPgVljGl9F7TziDZF5GwRP8=
X-Google-Smtp-Source: AMrXdXvu0K7uiBVSBodFgNi4CiHxxzGDwFnxNAmutwz2u25QpWLhWLzqKOL11KRxR/motEG+p4Atlw==
X-Received: by 2002:a05:600c:4d03:b0:3d1:f2b8:2eb7 with SMTP id u3-20020a05600c4d0300b003d1f2b82eb7mr1623595wmp.158.1672136886818;
        Tue, 27 Dec 2022 02:28:06 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1d12:b0:3cf:9be3:73dd with SMTP id
 l18-20020a05600c1d1200b003cf9be373ddls5393677wms.3.-pod-canary-gmail; Tue, 27
 Dec 2022 02:28:05 -0800 (PST)
X-Received: by 2002:a05:600c:1d89:b0:3d3:58cb:f6a6 with SMTP id p9-20020a05600c1d8900b003d358cbf6a6mr14829531wms.41.1672136885085;
        Tue, 27 Dec 2022 02:28:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672136885; cv=none;
        d=google.com; s=arc-20160816;
        b=qW9QPJ1iM9DIA3QKCCUWqVLQsFifEcglYRA/zSZa6VzTAAEyUiIP1+U4tCQ1PP0yIJ
         yaTAufgz9bZ3wlkhuet2b1HjMiLghZeRxfNtqqMGFBM/TKsx0XTZcqfQo7aFPdhOj6dR
         Kc/RNiNqVk6/anyMMD9DABY/PrEtOPSU3n63C2ODGnglzikwOCBOFMJAJyL9GZzsgYtI
         98pLD2BCpBu53zJ8UnsLsavKUUFAiv8W1/bmM6mux6DhGvD5XNHBc6RZmMwwlOJ/MsVQ
         huPdJ+cn+d11P4+8wtr6DLT/47wNrv2lQ5G22T041P/sGJLr7L1pmMNOWVxVkpXlC9aN
         WZWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=+MdD/1kRbmVG8yjokIBlLmy5jD06HHrCMHUEE0/sVnY=;
        b=d6ftTMFmK4GpfK30CZOs/tM9e7SinrJ1nWSFGh6/ryLT8iiKxmIdOeTY0nUIfMgWPX
         xZldBZAkmi6ic4/Yvl8jG3LSf0c0aJtBvL58ISJh5LDfbFQvrlUuIJZXV8wVxDdVQH7y
         +hzLizaPiEq6F1p8kCUGJoyyU6DXpxrFMslXBVSjRiPO5ZJR/y1hpuWrEcIHeiJG9bM6
         EVSA+T1gvGfFnx+mDxSFTZAza9IorVr6sioHdKZnov4j23GbplqgrIqTydHNqLjl9keN
         BtEox65nEDlSaEQiRzjeJ4YR+9M6TYZHW9gFbZZs3aAuQt7xwGCv+9pSl0JTvOoxrJ63
         iJVg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=bWWvBaFa;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id y5-20020a05600c364500b003c4ecff4e2bsi595039wmq.1.2022.12.27.02.28.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 02:28:05 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4Nh9pX4x1lzygv;
	Tue, 27 Dec 2022 11:28:04 +0100 (CET)
Received: from [172.16.2.140] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 27 Dec
 2022 11:28:04 +0100
Message-ID: <21effb9c-e2da-b611-3318-03646d749cd9@oth-regensburg.de>
Date: Tue, 27 Dec 2022 11:27:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: Help: About jailhouse cell stats XXX
To: =?UTF-8?B?5byg5a626ZOt?= <j.jyaming@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <71033b4d-67fd-4aad-9605-cb4c01b2c01an@googlegroups.com>
Content-Language: en-US
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <71033b4d-67fd-4aad-9605-cb4c01b2c01an@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=bWWvBaFa;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Hi,

On 27/12/2022 04:22, =E5=BC=A0=E5=AE=B6=E9=93=AD wrote:
> Hi,
>=20
> When I used command `jailhouse cell stats XXX` to evaluate jailhouse=20
> cells, I ran into a problem. Does this command provide additional=20
> options to output the result to a file? If not, how could I do to get=20
> the file to show/record result?

you can access statistics in /sys/devices/jailhouse/...

   Ralf

>=20
> Thanks,
> Jiaming
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/71033b4d-67fd-4aad-9605-c=
b4c01b2c01an%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/71033b4d-67fd-4aad-9605-cb4c01b2c01an%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/21effb9c-e2da-b611-3318-03646d749cd9%40oth-regensburg.de.
