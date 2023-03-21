Return-Path: <jailhouse-dev+bncBC3J54VZ4EEBBQHQ46QAMGQEGSUCC6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8236C3939
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Mar 2023 19:32:33 +0100 (CET)
Received: by mail-lj1-x23e.google.com with SMTP id m5-20020a2ea585000000b00295ba03f905sf4325234ljp.12
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Mar 2023 11:32:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1679423553; cv=pass;
        d=google.com; s=arc-20160816;
        b=GjOdnykYPyUU8BmuQYj0WrHPsM0ziy7u7zKKScMFqDrAcTt0TWz6u84t+pf3Wj7tlf
         jN4WfR3SD1JlOJKYm5kj0nmqMATWtrlalzudnlm3HV+EUp7lvLEeVQH2H+Na6IWesX03
         8zFpxh3I1LEVnkXuW3K/9h9QP4gIAMf30stgxm0T1rWDT3gm138LorRsG0jAcfkYSAn3
         c8Cziyf7bksAowqUhGTfzumjflLTuK3SDApp+D405MGet/e4ki4jRIXB3z+FDtMofhaM
         gE4VV8HPXMwwplKk5VhTTFHcVchK1mbFJ3KWebtpM+G5/C5dMTSRcIKa72MF2cJhjlRZ
         20OQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :sender:dkim-signature:dkim-signature;
        bh=pRIe7ZdTjxc6aOZnUeQ6qFpHqONEKsrapswej0mU13w=;
        b=NrlsiBlhQoIlI/EGH+HrvRPZMbSLv/li4wNOs1YhF1mc4Sx5TS+F6XK36YHl5omum9
         mlVlDGrjVDMLD3UaaijIqKoRVBSD5oELD/NVbgovheutXrdNiuppbUuyRJgIKwGUd+B5
         d1FuvLxyTcVYdFOVoWyHAbMu7SlIm86blYy0eSklH0SwztJoVjq+SoGmY511lnjI93ht
         IHbH/hIZm0om8dyZTTmsP3ESSQR6YbJcJJTSGVK/pjWpAWWWIa0YglVD6pL6AsF1CVPI
         GCovZcUOrFbKIGrUsi73h1quAlagWesX1iuHuMADLBxd5r93scJZ66/oUOv+04FgmBXe
         T0gA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y+9IC5XG;
       spf=pass (google.com: domain of daniel.baluta@gmail.com designates 2a00:1450:4864:20::52a as permitted sender) smtp.mailfrom=daniel.baluta@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112; t=1679423553;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pRIe7ZdTjxc6aOZnUeQ6qFpHqONEKsrapswej0mU13w=;
        b=h9E+4ThhblKB6HC6JX+f/DS3fJjDl7C4c+UC/GIdPdq+598n7i3V6Og8oHeVBhZBmS
         oLpqafz0Y11Ev2ARQ0ALO/EjnpMsnO9GLxWL75rjSuxGxwAQMLI+J8OtrEhcUDNXTeBJ
         iXbTVDfBIEZuV6/jYfZbXK+tAnKIRuiB+CXsuvp8w25XBfk6/GanYBtxjDK2j5kZoZ+L
         87viFheSS6tQdh3ZQxd+i7TJlZNrHNxRQRBj8He+sxaxZxeCWVS/qSUU6oLKO5RUCG92
         KvlA6+hIJIUOcu9XLTVt6HzT1UBgnBeLLbihr/mxitsMqF7OMtDdTMN/3AhrlO3LLSvs
         mGfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679423553;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pRIe7ZdTjxc6aOZnUeQ6qFpHqONEKsrapswej0mU13w=;
        b=Ga5NbY4GDuHTdJcheBi4RWTny0owvUtMo3Hhhnrsy3qY88RryI+p7p2r98JLjsCPJh
         zf3qkFWa4mko1444q+dzMcatVBJFpMHmUCNvUSwNrIB1eCSgVgHfZ/gDorFzd++4CfU2
         VlPAnRHllF7AWpxBC2TgIL/Qig9NX3cw+ANZiMAhHYGaEmRQoA2Ve3bPPS3Fh7zSFZSo
         hrv3rTy+q/n1qw9Sck4LHk1Cetfe5qeOP5SuD69YNEKNk0xYcGftShYKQBtxl/nmfqGR
         qfyBd/4bilUbCKWBq8n38nyxLP80t8K5bcabY1MMrSxWvmDDwpHXVLtKxMY/TuYW+aQL
         MJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679423553;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pRIe7ZdTjxc6aOZnUeQ6qFpHqONEKsrapswej0mU13w=;
        b=PqYNwn2f8PmOJKb6lRW+l0+TSE6o9DBvLbV7QYq4Gvs9R5VLf64dlnORheCyjdOA7w
         Yh9q2IjHGuoiqagkrjPu8RhSCrsSPeXhAEcWL6a965MDg64NtLdnPkASTaCrIxTWqXmk
         q8twvFwnn9x1G7tjmHdZ8742OEKql+cDquvrDlUTCf4hlO8kwtdzp8I9DJ2bseUBngg1
         NOSil8vhUt1BSh13sE0vbbcl2Flb0+jKFtlbvMBa51OcVKxQctT7Walf5rFzP1YGcYv0
         ZUqKXRUCtMnm0qs8rZ3ip0RO59Uboquyfex6eIfZlAKyAB488AAqnAfuG5a0QMbZkBsS
         QmRA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKU1emCt0ni3KpOVGDSbUfHzZwcNBr0fD6kJ+wUhME/cfEk1Tyf3
	EVaX4+0Uwu9PMRCtt6xSw94=
X-Google-Smtp-Source: AK7set8SCdwDQYHNGEeK6Hv7gkdWn8uhfLNd9yjJ4vLohMUMpP6xQZ7Lc0zIdliDDHk74b3Z7d27qQ==
X-Received: by 2002:ac2:446d:0:b0:4ea:e296:fead with SMTP id y13-20020ac2446d000000b004eae296feadmr1077099lfl.3.1679423552894;
        Tue, 21 Mar 2023 11:32:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:368f:b0:4e8:6261:7dc1 with SMTP id
 d15-20020a056512368f00b004e862617dc1ls780293lfs.2.-pod-prod-gmail; Tue, 21
 Mar 2023 11:32:30 -0700 (PDT)
X-Received: by 2002:ac2:514f:0:b0:4e9:609c:e901 with SMTP id q15-20020ac2514f000000b004e9609ce901mr1174139lfd.21.1679423550679;
        Tue, 21 Mar 2023 11:32:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679423550; cv=none;
        d=google.com; s=arc-20160816;
        b=Dnk5Z2TpKRqWvrEzgOckRND4YQwLluZKiESKX2r/ybC+ibUFvSEYNDYxbeLRiJ3Xdg
         7QHQc+QUYPLTBmxfZ21G0qP8LqVyl1r7Jx1NWHaLwYTx8uPeO6rODM/YQJOdXQ3Yoy6v
         +okYDfxdN2A8dvY9+8BFpwd1zyWvZm1mYkQ3kMz45ciNOmP2PfUYdpNuG12z9346W1gd
         HhWmfhMPZs4hb6d0YXil8/YXKDkPRiHB8ZafUK8CgoHw24qFvRl6a453Vkpbx68KqEk7
         W2ws+kVL3L8CiryASQ8g6K1bKp8wEh4HbipwsncpIn4BiqqUxAIuqrWWnGtGv+GfBz5y
         vhng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5DQkD8kQLSO96Rwdk3qzWmqj0HcLTBLfhSsRFDDNnKE=;
        b=Fvn5gj1Bn8NHdHB3VXnw68HNbaL7KJOMksAJodgH27fFyHziVBaGAU0hwFT7YeBwrv
         6ue/RymQo4XVW5qeDO3QhSCUONhwEdvBaRrC7yko7J3IXdQFlHL6UBcAtPRjWpGvCckY
         3NPPIvaxc9x3zhUGLZ8YY4vOsfGDonwSxU71dgaCfOPTg8A5/2uqbDivaeM3wupfhpxn
         1WEy7t+kSwdNyeiVpx8WZu3VHA0/AgGsZX4OOzLBBZyHGnmg2FbCxudPKdhc3V6J3oxO
         qHWmkpU6wkdaLhciOC53ynIjlgOes1jGHXH9nYWXy7Qt4wLk+f2pAX1ruFmGAJNeMo6k
         ZGcw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y+9IC5XG;
       spf=pass (google.com: domain of daniel.baluta@gmail.com designates 2a00:1450:4864:20::52a as permitted sender) smtp.mailfrom=daniel.baluta@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com. [2a00:1450:4864:20::52a])
        by gmr-mx.google.com with ESMTPS id h4-20020a056512220400b004dd84067a4asi643048lfu.4.2023.03.21.11.32.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 11:32:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of daniel.baluta@gmail.com designates 2a00:1450:4864:20::52a as permitted sender) client-ip=2a00:1450:4864:20::52a;
Received: by mail-ed1-x52a.google.com with SMTP id ew6so427590edb.7
        for <jailhouse-dev@googlegroups.com>; Tue, 21 Mar 2023 11:32:30 -0700 (PDT)
X-Received: by 2002:a17:906:3b1a:b0:930:f984:c56f with SMTP id
 g26-20020a1709063b1a00b00930f984c56fmr1799783ejf.12.1679423550296; Tue, 21
 Mar 2023 11:32:30 -0700 (PDT)
MIME-Version: 1.0
References: <VE1PR04MB6607BED3DA85B3BFC335000792BF9@VE1PR04MB6607.eurprd04.prod.outlook.com>
 <83472a1d-e6cf-3336-a4a8-df3c6bcc2cab@siemens.com> <a22210d5-6ea5-4926-acc4-fec65ca36884n@googlegroups.com>
 <e442d6f8-e9f3-467e-8a9e-5ef053b6e46d@oth-regensburg.de> <CAEnQRZA+VCWGRPjuXSDwaRuadNAy2j9UOKpQr0KYiNdo8SNHyA@mail.gmail.com>
 <cac44592-744a-047c-80b1-c01cb9ba04f3@oth-regensburg.de>
In-Reply-To: <cac44592-744a-047c-80b1-c01cb9ba04f3@oth-regensburg.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 21 Mar 2023 20:32:18 +0200
Message-ID: <CAEnQRZCjODX=6cOzFnC=GqRL-bA9ozG3wvUrsUcwB6d7r7H_Xw@mail.gmail.com>
Subject: Re: [EXT] Re: Question: integrating Jailhouse in the Linux kernel tree
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: daniel.baluta@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=Y+9IC5XG;       spf=pass
 (google.com: domain of daniel.baluta@gmail.com designates 2a00:1450:4864:20::52a
 as permitted sender) smtp.mailfrom=daniel.baluta@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

On Tue, Mar 21, 2023 at 7:19=E2=80=AFPM Ralf Ramsauer
<ralf.ramsauer@oth-regensburg.de> wrote:
>
> Hi,
>
> On 17/03/2023 15:19, Daniel Baluta wrote:
> > On Fri, Mar 17, 2023 at 4:13=E2=80=AFPM Ralf Ramsauer
> > <ralf.ramsauer@oth-regensburg.de> wrote:
> >>
> >>
> >>
> >> On 17/03/2023 14:49, Daniel Baluta wrote:
> >>>
> >>>      What you can already do is pushing the setup into an initramfs.
> >>>
> >>>
> >>> This won't really help in our case. Our driver (Sound Open Firmware)
> >>> runs at boot and somehow
> >>> it already expects that the jailhouse to be enabled in a controlled w=
ay.
> >>
> >> Why? What happens?
> >
> > Our driver loads the "inmate" firmware like here: (1)
> >
> > https://github.com/thesofproject/linux/blob/topic/sof-dev/sound/soc/sof=
/core.c#L238
> >
> > And then later "starts" it, like here (2)
> >
> > https://github.com/thesofproject/linux/blob/topic/sof-dev/sound/soc/sof=
/core.c#L252
> >
> > By the point our SOF driver code reaches point (1) we already need the
> > jailhouse hypervisor to already
> > have been setup and the inmate enabled.
>
> I still don't get why that must be the case. Why can't Jailhouse be
> enabled later?
>
> Anyway - You could have both as kernel modules: snd-sof and jailhouse,
> and first enable jailhouse, and after that loading snd-sof.

Thanks. It looks like we don't really have other choices since jailhouse mo=
dule
doesn't export control functions to other modules.

Thanks for your answer.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAEnQRZCjODX%3D6cOzFnC%3DGqRL-bA9ozG3wvUrsUcwB6d7r7H_Xw%40mai=
l.gmail.com.
