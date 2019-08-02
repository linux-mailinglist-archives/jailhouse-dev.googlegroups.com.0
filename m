Return-Path: <jailhouse-dev+bncBC7MJ2PM5UERBH4RSLVAKGQEB4IJPPY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x339.google.com (mail-ot1-x339.google.com [IPv6:2607:f8b0:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B51080092
	for <lists+jailhouse-dev@lfdr.de>; Fri,  2 Aug 2019 21:01:53 +0200 (CEST)
Received: by mail-ot1-x339.google.com with SMTP id m16sf41501997otq.13
        for <lists+jailhouse-dev@lfdr.de>; Fri, 02 Aug 2019 12:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Scy1C1Jp6A+zYz90TyC+xJpbSnH8e76VS903UKAEhKE=;
        b=fT1xdZQdTem8T8o6Pa0RUW84H/SbLyuZ387Be2KPBx1hS7HAKqoaOJtoQuZO1DA0ST
         CuxCMeVXI1XBvP6IaCp3TWtqOPaBoJ/8YJgl0d/aAi7WO76mhqloFCx9p0Nks2butcSF
         c+JXmeMV6A+c8dWXJgYUo+ekkDmZ8HeCnEtxVyumPkcwSF6GhQx/K9U02xrInEobCMDl
         yfX6SrSgXl1g31bVbv/YnykkzkNKvrAYxf0Q8U/MK7aTVHIxXts/3/t9PC19YxAk+wHv
         ngK09G3zpa8OGOfkH0HERFtbBlA6fMp3YWmH9TiR2NIanNMU2Q1gvfQh3oGw0ap3jITP
         FVSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Scy1C1Jp6A+zYz90TyC+xJpbSnH8e76VS903UKAEhKE=;
        b=DfyHqtB2T+pdTfGdqK/AL6qiTk+7T7gp/rfMvwhcW1GHSMxZQOfcY1+zRYAd1kYRkA
         dyqzT8xc8mnspUDOGg3fTNvs/dRFe92vjypVINM5d5sI+rLFf2jTYIdbTeGfi++YNs0n
         9MEPVIJCkMkoxqav1tfkIboxwg7X6IIxAZlb+7NZAgMyTCHZHTC70oQbLI3WIuM9ZGTH
         hcKp5DJnKUB24jNgqpEBFLVS3UJyaVbm9U9/DBmd4vK/xFri5d+MjSbDTc2l2wojLgAl
         4YO2WYdpRamYHib/eqQ7EufflGIKVYdluYBoMRSdXIw+0QA9JyXT69bivuhUvouEcZuP
         /92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Scy1C1Jp6A+zYz90TyC+xJpbSnH8e76VS903UKAEhKE=;
        b=Meuesm25ABoWX/YLb4Gu5PBAN3yLCsW2SLUn9qfNpOkpBkbPFeW83Puaenv82uvbdk
         IEne1/1v6mMFMeZ3pzHtiNPwZODc+cmXXnu3SdKULjFA3jFx687SOEHR6VtOPR4Fvk7v
         epJAOgqSXRWkIMPpa3tUltaavcIa3+xNwDipMocou7nLspNxcCCfaW6eTMSx9gCyG38p
         SoCzjrG+sV9rbPGBtihUY0dXE6DGlQExl1okg8B8YFpAsmKTxC01QQ5QwxEP96TWmHxI
         zeRrwyiLeywoNEvKqmGpCnBuSdno2bGA5sBsjfsVVQ8RNC61mVe6c9nDZrdNnB76HFDg
         Nhdg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXyX6lSU8JyGE1lm4Sw8fDw8WIY/2fMDE7bY/bu+A0UrtoKZt76
	t1TS6xBNiLrR9wCAWeLgpt8=
X-Google-Smtp-Source: APXvYqw72khiZgLXao4y3uXaUizrvsVsbXA+NPEGN813n6tJ51rdcq2bAxjqH34ktnNbroy1A2o+nQ==
X-Received: by 2002:a9d:529:: with SMTP id 38mr102364893otw.145.1564772511833;
        Fri, 02 Aug 2019 12:01:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:1e97:: with SMTP id n23ls769155otr.5.gmail; Fri, 02
 Aug 2019 12:01:51 -0700 (PDT)
X-Received: by 2002:a9d:7a9a:: with SMTP id l26mr25125275otn.71.1564772511197;
        Fri, 02 Aug 2019 12:01:51 -0700 (PDT)
Date: Fri, 2 Aug 2019 12:01:50 -0700 (PDT)
From: dianaramos007@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <729af1ca-261c-4f43-86a5-4582753cd864@googlegroups.com>
In-Reply-To: <22c9aeae-ac3c-b07e-da80-82bc6f153dcc@siemens.com>
References: <15e809ef-6d04-4df6-a706-7fa43e7deee3@googlegroups.com>
 <f6e7c240-8686-aeff-1167-a8350e0cb03f@siemens.com>
 <0d5266f5-700e-4002-bd8d-4f3f6f65677e@googlegroups.com>
 <64ec235d-fe28-e181-7c7b-c00956fea706@siemens.com>
 <389dded1-c061-4966-83ac-6e1176dfc152@googlegroups.com>
 <22c9aeae-ac3c-b07e-da80-82bc6f153dcc@siemens.com>
Subject: Re: Problem with IVSHMEM on Bananapi
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_877_286753370.1564772510668"
X-Original-Sender: dianaramos007@gmail.com
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

------=_Part_877_286753370.1564772510668
Content-Type: multipart/alternative; 
	boundary="----=_Part_878_22242381.1564772510668"

------=_Part_878_22242381.1564772510668
Content-Type: text/plain; charset="UTF-8"

Hi Jan,

Concerning your inputs I still have some questions that I would like to 
clarify with you.

Both your cells, root and non-root, access the ICC at 0x1c20000 here. I 
> don't 
> recall the nature of this resource anymore, maybe it can be split at 
> register 
> boundaries. If so, define smaller sub-page regions in the root cell and 
> had the 
> subset of them out for exclusive use by the non-root cell. 
>

> Currently, you revoke access to the region at 0x1c20000 from the root cell 
> when 
> creating the non-root cell. 
>

The configuration files for both gic-demo and bananapi (from wip/ivshmem2 
jailhouse's branch and queues/jailhouse-ivshmem2) are similar to the ones I 
was experimenting with in kernel 4.13.0 (from master jailhouse's branch). 
However, now I'm getting all the unhandled traps (i.e., Unhandled data read 
at 0x1c20060(4)). Could you please explain me how gic-demo was working 
before with that kernel and not now (with queues/jailhouse-ivshmem2 from 
http://git.kiszka.org/linux.git/), when for instance the address for CCU 
was the same in both cells? For instance, in the configuration files of 
both cells, CCU was set like this:

/* CCU */ {
            .phys_start = 0x01c20000,
            .virt_start = 0x01c20000,
            .size = 0x400,
            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
        },

Moreover, I followed your advice and tried to split the address 0x1c20000 
at register boundaries. However, I might be doing something wrong as I'm 
still getting unhandled traps. Could you please provide me with an example 
for this particular problem. BTW, is it possible to use addresses that are 
not listed in /proc/iomem for entries in config files for cells, i.e., that 
are not assigned to memory mapped devices?


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/729af1ca-261c-4f43-86a5-4582753cd864%40googlegroups.com.

------=_Part_878_22242381.1564772510668
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Jan,<br></div><div><br></div><div>Concerning your =
inputs I still have some questions that I would like to clarify with you.<b=
r></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin: 0=
;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">Both yo=
ur cells, root and non-root, access the ICC at 0x1c20000 here. I don&#39;t
<br>recall the nature of this resource anymore, maybe it can be split at re=
gister
<br>boundaries. If so, define smaller sub-page regions in the root cell and=
 had the
<br>subset of them out for exclusive use by the non-root cell.
<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin: 0;margi=
n-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">
<br>Currently, you revoke access to the region at 0x1c20000 from the root c=
ell when
<br>creating the non-root cell.
<br></blockquote><div><br></div><div>The configuration files for both gic-d=
emo and bananapi (from wip/ivshmem2 jailhouse&#39;s branch and queues/jailh=
ouse-ivshmem2) are similar to the ones I was experimenting with in kernel 4=
.13.0 (from master jailhouse&#39;s branch). However, now I&#39;m getting al=
l the unhandled traps (i.e., Unhandled data read at 0x1c20060(4)). Could yo=
u please explain me how gic-demo was working before with that kernel and no=
t now (with queues/jailhouse-ivshmem2 from http://git.kiszka.org/linux.git/=
), when for instance the address for CCU was the same in both cells? For in=
stance, in the configuration files of both cells, CCU was set like this:<br=
></div><div><br></div><div>/* CCU */ {<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_start =3D 0x01c20000,<br>=C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_start =3D 0x01c20000,<br>=C2=
=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =3D 0x400,<br>=
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =3D JAILHOU=
SE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 JAILHOUSE_MEM_IO | JAILHOUSE_MEM_=
IO_32,<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },</div><div><br></div><div=
>Moreover, I followed your advice and tried to split the address 0x1c20000 =
at register boundaries. However, I might be doing something wrong as I&#39;=
m still getting unhandled traps. Could you please provide me with an exampl=
e for this particular problem. BTW, is it possible to use addresses that ar=
e not listed in /proc/iomem for entries in config files for cells, i.e., th=
at are not assigned to memory mapped devices?<br></div><div><br></div><div>=
<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/729af1ca-261c-4f43-86a5-4582753cd864%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/729af1ca-261c-4f43-86a5-4582753cd864%40googlegroups.com<=
/a>.<br />

------=_Part_878_22242381.1564772510668--

------=_Part_877_286753370.1564772510668--
