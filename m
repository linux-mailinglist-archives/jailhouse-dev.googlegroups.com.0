Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBBL624H5AKGQEDW7XK4Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83c.google.com (mail-qt1-x83c.google.com [IPv6:2607:f8b0:4864:20::83c])
	by mail.lfdr.de (Postfix) with ESMTPS id B65DD2626E3
	for <lists+jailhouse-dev@lfdr.de>; Wed,  9 Sep 2020 07:50:40 +0200 (CEST)
Received: by mail-qt1-x83c.google.com with SMTP id p43sf1075343qtb.23
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Sep 2020 22:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=BSoREwsmeA5DhuCVZOk4wvYfXVROzY+0pDkzPH1XLJI=;
        b=RmSnRDrbeOrqCaSWds398Fu9QK9eurGB1SnCG1SVV+1FLKoOuzmH1t6x+tfCN/Vq2f
         P38U7+3TUhmXHO5Z0SQfBwLbzsaAFU9GnKGux0wYpNS2C4fnWDH9l/O87SgAp9aes/aP
         jKuEZHHSAft4ZWISSHyo7BQiBCT2HDFiXuO59/XvpE7Cp3IBeVcSyoU6FlTL3BpfqtUF
         mmYqoS5EOhze6zQtxNSZvvrakpUxVF9Ul4n2ETAVd19E7pb/j0n2nPYEzBg5HeQMVZpQ
         c+nzGXqdd1XH3ehXiU14O1L+YGb7kYrA75UKJ+l7o/PeFXwuNa4A1bZ405Ha5X7WF3Km
         PJiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=BSoREwsmeA5DhuCVZOk4wvYfXVROzY+0pDkzPH1XLJI=;
        b=XbjBiibbWF5EPJIKmwuEKYTdgCSviYTOgZ36PdPuy5DuzzxVp4Knpm2+B/awMEKe3m
         74i0i8VakQcCy6dLIaP0rAlmCSAipix/pTIQ/dv7kSAUdcM47ozcGHJD321ihhlM8Off
         YZoi3BKn/sMXGhysmVnpb8UiufZA/Cd78BcOb3H52SbHLZI9WZ1q0j9+nqfb1GRdji8F
         p+7/beF70fk7UK1mv5pDmvg+QCGVZdk5e46Quo86iqPSKqzUDkLu8nMR4zMCh1hlhq5l
         zmzcl+auaB+sSz+Wlz3gOELCRkAYZeZB48Bna4xWeWnpOsERjZnXi1uDPtP7E3iWnvnu
         oexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=BSoREwsmeA5DhuCVZOk4wvYfXVROzY+0pDkzPH1XLJI=;
        b=H/bApRLm2JfhQXrfhyLvfG+e1U3+JWs6+b6dHZOke3Y3q8VyJ0ntDUMn3RvobXgJZ1
         /5RXokoki+1gzTXA/fC5sOCO9nArdSuKAgHSbS0Yo+DF9oZHmZKVZeDF/g64Pfh1wQBj
         AAJqO0+6vCxzDYlyBUzKxaVfi6QjxwXRu2QRsub0nRnWE0nOehhgEtnK5nkL3drpRmjG
         bIYSo//TivOhErJHmExrVl2gjCZCnRglW61NrGxvoffGjRJH/oqMu+gnKs966ZDcSiIt
         l9+VQp0k0CtoJ+/crdHxqxVC+x/rhVZMuWZOKlozYnyVo3DcO9p0Vrb95DDQZOw9Ksyo
         vhXA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530NiVf6K0QNMqavk9UO0LjQ5JoVhqQefAtxGpVAq6wfCudS/71i
	jbW4Wf8OdJklqsFbs33rKfc=
X-Google-Smtp-Source: ABdhPJyw09soQB97zl9e5mlbKzni7hpIM4fk6dwRG6pvbb0Zcqz2IlTZZA3on34DMF05vOsB4GjnEw==
X-Received: by 2002:a37:5042:: with SMTP id e63mr1779601qkb.453.1599630639534;
        Tue, 08 Sep 2020 22:50:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ad4:42b3:: with SMTP id e19ls336233qvr.11.gmail; Tue, 08 Sep
 2020 22:50:39 -0700 (PDT)
X-Received: by 2002:a0c:99c8:: with SMTP id y8mr2658077qve.53.1599630638832;
        Tue, 08 Sep 2020 22:50:38 -0700 (PDT)
Date: Tue, 8 Sep 2020 22:50:38 -0700 (PDT)
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c5f91e66-7742-4736-83fc-8565b08989d5n@googlegroups.com>
In-Reply-To: <992cd8fe-ef09-d0bc-119d-e488de158759@siemens.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <138c5784-6dbd-add0-2364-9fef4b7a9ea6@siemens.com>
 <de0ebbce-9513-4820-8975-781f816f9841n@googlegroups.com>
 <0e52381f-15b2-e833-7717-6335ddcc5f35@siemens.com>
 <CADja47McPVRWvi8u_fP8z7ZqPGcdW324AKG2e0iK_osTCd=Qkw@mail.gmail.com>
 <6f67008c-1b56-4c4e-9442-d011d178e895n@googlegroups.com>
 <6ad242dd-b69f-4176-a10a-1e84edf3b670n@googlegroups.com>
 <033bbd67-9d28-c615-2120-765f0a93ab00@siemens.com>
 <276eb4de-5351-474f-a8ae-a0a038056c78n@googlegroups.com>
 <199d40f2-9ca3-d618-101d-d7c33d450af9@siemens.com>
 <b7dd4477-cf1a-44e5-9f7d-5c0bb474d26cn@googlegroups.com>
 <c31c0a2f-17a4-d970-5f5a-7d26a148a740@siemens.com>
 <0acc82dc-fbc9-4d81-bcde-69e611aa01b7n@googlegroups.com>
 <e0cf2959-7653-4fda-93b5-5abfdd188414@siemens.com>
 <0cf9a640-02d0-4928-873e-08d407bbed17n@googlegroups.com>
 <4fbc4f7c-de79-8bbb-357e-f5a056698f56@siemens.com>
 <14e0bc1b-c52f-492d-aad1-a565969f73f5n@googlegroups.com>
 <992cd8fe-ef09-d0bc-119d-e488de158759@siemens.com>
Subject: Re: Build jailhouse on embedded target
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_638_1711265266.1599630638076"
X-Original-Sender: stranzjanmarc@gmail.com
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

------=_Part_638_1711265266.1599630638076
Content-Type: multipart/alternative; 
	boundary="----=_Part_639_1157709568.1599630638077"

------=_Part_639_1157709568.1599630638077
Content-Type: text/plain; charset="UTF-8"

So far we have successfully built all of our Linux BSPs with the help of 
Yocto.
I assumed (wrongly) that if there is the Yocto layer "meta-agl-devel", you 
will be able to build a Linux system that is suitable for "jailhouse".
Jakub has already told me that he has only tested the "meta-agl-devel" 
layer for RPi4 as a real target (and not for x86).


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c5f91e66-7742-4736-83fc-8565b08989d5n%40googlegroups.com.

------=_Part_639_1157709568.1599630638077
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>So far we have successfully built all of our Linux BSPs with the help =
of Yocto.</div><div>I assumed (wrongly) that if there is the Yocto layer "m=
eta-agl-devel", you will be able to build a Linux system that is suitable f=
or "jailhouse".<br></div><div>Jakub has already told me that he has only te=
sted the "meta-agl-devel" layer for RPi4 as a real target (and not for x86)=
.<br></div><div><br></div><div class=3D"gmail_quote"><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/c5f91e66-7742-4736-83fc-8565b08989d5n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/c5f91e66-7742-4736-83fc-8565b08989d5n%40googlegroups.co=
m</a>.<br />

------=_Part_639_1157709568.1599630638077--

------=_Part_638_1711265266.1599630638076--
