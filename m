Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBTN7RL4QKGQEWKH5IJI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA9D23304C
	for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Jul 2020 12:24:14 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id j16sf7794385wrw.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Jul 2020 03:24:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1596104654; cv=pass;
        d=google.com; s=arc-20160816;
        b=iEx2i3eZaLYnDNsJWfkTxBGy5FeeQ4ItTmOxbNR8H63wer3BgMFSL5TyTiWdbqkjGL
         NlVTnIsqZxan7r1ef28bTjhdv2cpYTXWqLMBh7vqLl9hCbzwn+WSjXXQ3YirDsSKOxvB
         Lb/ZExUxm4OXwfLsgV8Vcqz44r1CuJgR0xouW8o4Djj/WnO6RRIVuimOw8EJN/VBLVeQ
         lP0oaQH51sSXY9ZhQUvCxTgbLfBHXU02P2oa0eP0JiOY1PooUZt+ii+0+lzg+kZajTnv
         aHgtjLGO8Gc+7pTh6/rnQWup2beNRevS7MDnw4ADiaBJsV1pMHzxyNBriNb3QbT5pz4Z
         OKdg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=qNqbUH71stt6TfJy9Knz17GhTtUl4GrVI2cObz9C6fc=;
        b=EJYreiVEiNTBlkn99Gp/3adgtDSQ0z8Lq9s4RSMOHOLh2XyRrd0xw4LCtatm8pI9i7
         nMMkOxl/S8TxC+NctEqmkK+WTdZaD8ml7fdHmn+CGxjctVDiZdigsXsuAKMWgKsEmkrt
         QJ++3IILEpce9zNs4bGbfkdGmfSZd0uXsaQK8Xq7Bu7rYyLtykpq7MDw2OSfttI+Fawb
         XGeFbpDeQ+5AlILlJWU1T4iiZ2dD2RMPw6blZUUfD/nJZvXKAad7DH0zkNcO7vRhHlqq
         3soM2toCxvrD2EQ1rJuqZK2bMdSjeyBJSdjeue5vNqwQ6PvwyLkUp1cQnAVIvbULG3jp
         aoEA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=qNqbUH71stt6TfJy9Knz17GhTtUl4GrVI2cObz9C6fc=;
        b=GDlBcaJaZcj9muq+rVWPq3Lr2yV0WUGBm5raA/DgHg6vMhux5HnZmfSkJ0Rn6yCJSq
         WmoVfYjNt2wNPW/XPI3lQbw5uCJ5KWfW/jg+SkC9bjDIT1Vbuqwqf3j2rK9mf5E+A1O4
         8Crgu4vD7K3kvcnz0ci8FL9KMu/MdUGkVT+e0+xjNx93bYIfyiC6fvQ8kguMmawRJ4xT
         QAyEALtPifwSkJcv0FMoUPDxBPVMkBx/V1B+c+TD39wDWsOssVtbEvbbT1Q/tSGEeqAs
         sQPreuWF/aGvqiYwYlJKpMtZYptBitr0QqDG1GbjPR+PB3onFzsCQ3mXmJKdNC/xwWfZ
         t16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=qNqbUH71stt6TfJy9Knz17GhTtUl4GrVI2cObz9C6fc=;
        b=oO8z1IDpEhy3d5PL1KG8rxxD+4VccI5m6pksrsC2Q4Q7gU4uKt0QYE0wRdAzOrGxih
         HOiczXFSPFG74seI39We5m7E5xXexYU+b91mcfEKg4Xqug6D8I6XCS+2mDJrwUG+TbiN
         KcMZ8W0A40qt7LlGOfgFdhPUCfRtcP3chVY/FrvGxw3FmlQiqjQOydMeENde6uMpPPxu
         9DqE9FHt6ibACIfrs62XWhbHnMGM+yw1gdCsRBasIIc9mKOly4o7L+VCqzjdgqzcu+au
         K/88zngyYbZQg5qe/Hm/SxtFcIb60HO9jhctN/BG+qRtOd9QH5L2mpXs5meywKIh4pVC
         h0HA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533GrcWYGx2rtfKDUn/Frmv0eNIk/AIKsqfggDSgJpBQ9XNBFZ6V
	DRr9L2lLvUl4vX8dpAKm570=
X-Google-Smtp-Source: ABdhPJx+tjRUIRf6mVE8woZ7NqGwKWVcEoVEH1FXgzsvnW99tPdM6ACEew1Dsdq3fKqxB9zejId6vA==
X-Received: by 2002:adf:ef4d:: with SMTP id c13mr2332293wrp.198.1596104654024;
        Thu, 30 Jul 2020 03:24:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:9c95:: with SMTP id f143ls2442541wme.3.gmail; Thu, 30
 Jul 2020 03:24:13 -0700 (PDT)
X-Received: by 2002:a1c:2bc1:: with SMTP id r184mr13406809wmr.133.1596104653251;
        Thu, 30 Jul 2020 03:24:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596104653; cv=none;
        d=google.com; s=arc-20160816;
        b=QnDBTcC3N15X4BhhOeYR1dYvTNUqP5sJ+6N3lbtAKYicBYFuhCHHloOpEZnid7JgrC
         WBch7RxQAQ/S8ruhgyca6wdo1zhYzzqurrpGAsSTa80iOqubPlfqPuwLqUraDaZzfMnZ
         9dX7z/QURZWkO5t/CYXFCsDOhazlOe3CcW/h9EEA3SkCY6ePvVMh+y+XY8uZ0DWcM8Oz
         Tp4bnsLrFGcDPFqcEtGGycExRV6cnPhjsRhvZB9+SwpXWBZZAB5jkluLyd24ojmGXc4r
         7MvTq8s4X/oGl5hDgbWLHR6GQnntOnRs9MTKNAMD8Y8lY8bkgmn24KDOdWAMeE1ogW3Z
         LPxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=Gs6+nfvxVnp8gQ/B6U29aQrjEy4e3Vd0JEszfBpnfFY=;
        b=zpCzFQH3eul+gqRFDev4dx/HClGO5CgiNJSRc5d35jlo9Wl/mqRv3kmRa+3AISWelV
         hOdlUTxgJR14aLNNF+4tWEIQys5drLXalPzwdmTgmTpIAfNxD2mCQDFUSaz6+kAeqnfI
         zKN3S3WB947XR9BQGpDelSH0nm1n8UdjYes6RhFuoB5v8tpBlOKXmGHWR4thZfGisP7H
         RIzgGQZXhEJ1HmJBhLwJMnl5BsZWt6rJuZksurrQklmvGOPmQzXB10evklzQ6sr3bum0
         B+6mtODcpJUMKVmroTc2D8rvdmaRaaFAZGoeEGEkYjeOFqQpbN3Ga5g5/T1rMMmY+Lgt
         edEQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id f23si443601wml.3.2020.07.30.03.24.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jul 2020 03:24:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 06UAOC83010767
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jul 2020 12:24:12 +0200
Received: from [167.87.91.228] ([167.87.91.228])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06UAOBUD013375;
	Thu, 30 Jul 2020 12:24:12 +0200
Subject: Re: sharing inmate lib with loader
To: Peng Fan <peng.fan@nxp.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
References: <DB6PR0402MB27607A45F06E6F8FD23037DA88710@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <d15c26d6-5ed5-38a7-0166-144b09e308ce@siemens.com>
Date: Thu, 30 Jul 2020 12:24:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB27607A45F06E6F8FD23037DA88710@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 30.07.20 12:12, Peng Fan wrote:
> Hi Jan, Ralf
> 
> I am restructuring the loader code to make it share inmate lib, but not come out a good idea.
> 
> I am thinking such directory tree.
>      Jailhouse
>         |->components

I guess we can get away without that substructure if we fine clear names 
for the content dirs.

>                 |->inmates
>                 |->lib(moved out from inmates to make it share to loader)

libbaremetal? Not completely true either as it contains cell inmate bits.

>                 |->loader

bootloader? earlyloader? Just "loader" is too generic for me as it 
suggests to be involved in Linux-based loading as well.

> 
> How do you think?
>  > Thanks,
> Peng.
> 

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d15c26d6-5ed5-38a7-0166-144b09e308ce%40siemens.com.
