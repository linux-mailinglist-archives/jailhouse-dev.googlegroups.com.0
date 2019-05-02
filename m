Return-Path: <jailhouse-dev+bncBCR7PPMN34DRBDNRVTTAKGQEIRRC6AA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x239.google.com (mail-oi1-x239.google.com [IPv6:2607:f8b0:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 3986611FFA
	for <lists+jailhouse-dev@lfdr.de>; Thu,  2 May 2019 18:19:27 +0200 (CEST)
Received: by mail-oi1-x239.google.com with SMTP id r84sf1396371oia.9
        for <lists+jailhouse-dev@lfdr.de>; Thu, 02 May 2019 09:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Lm7mru7NtSjdTCMpDC0djmR4h8ypob/U8G5t3f/ukWc=;
        b=StN4BD9k2j/OLEBqqxMrYI9QoAgYZsxM35MXDXdpWEaPmNs6iuCRYMB2mCDLBj4UOR
         bicK4IS/ec4Ow+RZ5RWRplsE3txFAHlPxrxpBpVCnQNno+qA1f8ThOLVJHcPysgCnG3c
         yrqrVD/MViv5Hk8DE7B1EzTDN0zbljPWpINDruF8ipgBJIB3bTxMpBrHLDcUpxuelf8E
         l1DrYpFrdTQfCQZJ4NUXmjjMp43nExJTrOW3RMq8D8v4/a5JAsfghUDknc4q780+LrWM
         bm4lMEYDkNPnp8+4qMCLrrKj51jAz2Tv6DCT85T+Xczv7NeTqVCxyCB7CwtmhvUMG0qc
         MAGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Lm7mru7NtSjdTCMpDC0djmR4h8ypob/U8G5t3f/ukWc=;
        b=avNWF8EbRyZ+Cir6OQdv0p1urCN0CbeZjsR4DdtjXg6ctu8ANFrbQT9bv0cU7A5w41
         aX0P/6xdsqJLQrh2/nbUfvDxQQaLnhKHHrwAd9btIgo800n1Uv3R/vlsFrXdg8o7Y+iS
         bhFsOMSbaFYWZExfvDZuizLQ5HIMYj4BKkIIOXno3Bfs2GzAuQgiCiR04wXX6846K9ix
         m+caHsWG+GfQAk9LFGEY0cmXS12kND9mDPb++nde4Czp3t+SGNVj/Iz9NUeCmkN/Zfhj
         DORml1uu+18ehnBSLF6095fvvz9SNR2RLdqMJDMxjEXaL0Njwyc82TW8TFo+qQU2kEaQ
         idkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Lm7mru7NtSjdTCMpDC0djmR4h8ypob/U8G5t3f/ukWc=;
        b=iBX/GlweTNiF5EWUCDN2TTVJWa9vQq+zPXIVYaPBTMVy0jUCizILHr3uIcOYKL7ZZG
         pdJqfvZ6HMC/ZKeuAS5sOHnPXNRTzga4H+XIWg8cf6sWdU5NnvXctcxN77oPQon74stE
         qPDwNak0PgtEtbvvonjn/v8Vype9bKL0ZF+02uepAt/DtRtbKPUdUAUHuooLc/pdefG7
         yRsylKf3qhPDVoAXDV55g9+njy/MwggvIysOYyKzs42BqDEa6A7ZZMQ4isoK6sZuH7V0
         sEUGuyadsovuhk/YPxTdoNEUa8L8RiJ58grIbrDzsah8JqvgwtLQJ/Scwna8oQcAfzfV
         AjCg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXYs25IxaehsU2K9tSyJ0gbn8p5fseINVsMZpgajrPGNg67NJBb
	dncxeap9zYBPbldX6dZ72QU=
X-Google-Smtp-Source: APXvYqxGfj+086Uf4iEO+evYF0ZM6bsa2XjavUiRLPQYr9zzQ4HIGzNvYIlkJ9KDAPS9m26563hBLQ==
X-Received: by 2002:aca:ec41:: with SMTP id k62mr2987326oih.147.1556813965958;
        Thu, 02 May 2019 09:19:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:6b08:: with SMTP id g8ls309559otp.16.gmail; Thu, 02 May
 2019 09:19:25 -0700 (PDT)
X-Received: by 2002:a9d:64c1:: with SMTP id n1mr3290171otl.259.1556813965496;
        Thu, 02 May 2019 09:19:25 -0700 (PDT)
Date: Thu, 2 May 2019 09:19:24 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <d52c2827-6022-4bad-b879-543b238deba5@googlegroups.com>
In-Reply-To: <43d1d97f-226e-8e06-80d9-e4ee63c75dfc@siemens.com>
References: <e881f27c-ad5f-46dc-ab06-a69d27f54ff5@googlegroups.com>
 <0023050e-61cd-5b6e-b876-a1aff77173b2@web.de>
 <96357294-3e29-4db7-9017-d3e8ccfe546c@googlegroups.com>
 <3b94fefa-7112-40eb-93a1-2590fe9bdf81@googlegroups.com>
 <b5cb0801-614c-07ee-9997-204bed183924@web.de>
 <49238e83-72e8-42f7-9eb9-d5462dd48d1f@googlegroups.com>
 <fff24fa8-4cf9-5290-e550-999be52a177b@siemens.com>
 <932629c1-7e58-4ce6-bfcb-3db823544286@googlegroups.com>
 <08104912-32c4-4010-a7d0-55ac10a4437a@googlegroups.com>
 <3714e03b-9d45-4050-9b6b-d30b478f3198@googlegroups.com>
 <07630d92-4987-aae0-de76-43dd7aa1df1d@siemens.com>
 <da87b870-8284-4bdb-a801-d451399e6c21@googlegroups.com>
 <81b5e854-449f-bceb-9cee-c777639ec24f@siemens.com>
 <d39b47ef-3805-46a2-b244-274f8075354c@googlegroups.com>
 <43d1d97f-226e-8e06-80d9-e4ee63c75dfc@siemens.com>
Subject: Re: Inmate accessing RAM problem
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_500_1423997900.1556813964632"
X-Original-Sender: jpagsreis@gmail.com
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

------=_Part_500_1423997900.1556813964632
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

quinta-feira, 25 de Abril de 2019 =C3=A0s 07:39:41 UTC+1, Jan Kiszka escrev=
eu:
> On 25.04.19 08:21, Jo=C3=A3o Reis wrote:
> > quinta-feira, 25 de Abril de 2019 =C3=A0s 06:24:26 UTC+1, Jan Kiszka es=
creveu:
> >> On 25.04.19 05:11, Jo=C3=A3o Reis wrote:
> >>> quarta-feira, 24 de Abril de 2019 =C3=A0s 06:35:24 UTC+1, Jan Kiszka =
escreveu:
> >>>> On 24.04.19 05:10, Jo=C3=A3o Reis wrote:
> >>>>> In few words, what i am trying to do is to access the same memory (=
not IVSHMEM) in both cells.
> >>>>>
> >>>>
> >>>> JAILHOUSE_MEM_ROOTSHARED, just like for IVSHMEM regions. Otherwise, =
the creation
> >>>> of the non-root cell will remove access to that region from the root=
 cell.
> >>>>
> >>>> But this is not the problem you see when adding that region to the E=
rika cell.
> >>>> You really need to debug the guest. It is creating page tables at (u=
nknown)
> >>>> addresses which are not backed by guest memory.
> >>>>
> >>>> Jan
> >>>>
> >>>> --=20
> >>>> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> >>>> Corporate Competence Center Embedded Linux
> >>>
> >>> Note: this error from page table translation appears when i try to is=
sue "jailhouse cell create non-root.cell", before i even load erika-inmate.=
bin, so probably there is nothing wrong with the inmate, it is just a cell =
configuration problem...
> >>>
> >>
> >> I think you never mentioned that the error "migrated" from the non-roo=
t" cell to
> >> the root one when you added that region to the non-root cell. Apparent=
ly, you
> >> are now stealing memory from the root cell that is in use.
> >>
> >> So, can you please provide the complete log of your error and the comp=
lete configs?
> >>
> >> Jan
> >>
> >> --=20
> >> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> >> Corporate Competence Center Embedded Linux
> >=20
> > Yes, my fault for not being explicit enough.
> >=20
> > So the problem is that i'm trying to access from non-root cell an addre=
ss within the memory region seen by /proc/iomem as 3fd00000-5fffffff : Syst=
em RAM, and it gives me an error:
>=20
> You cannot take non-reserved memory away from Linux and expect it to cont=
inue to=20
> run, obviously. If you want to establish a shared memory region, reserve =
that=20
> from Linux, assigned it to non-root as "ROOTSHARED" (I already explained =
that),=20
> and map it under Linux as well (that's why we have ivshmem and the uio dr=
iver=20
> for it).
>=20
> Jan
>=20
> --=20
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux

Ok, i was a little bit confused, but now i get it.
Regarding the map_range() function, if i pass the argument MAP_UNCACHED, do=
es it mean that the memory that i access in the inmate within the mapping r=
ange is not cached when accessed?

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_500_1423997900.1556813964632--
