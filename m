Return-Path: <jailhouse-dev+bncBDOKTXXSZADRB6VQ2KDAMGQE7O5PDSY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83b.google.com (mail-qt1-x83b.google.com [IPv6:2607:f8b0:4864:20::83b])
	by mail.lfdr.de (Postfix) with ESMTPS id 821393B3181
	for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Jun 2021 16:36:43 +0200 (CEST)
Received: by mail-qt1-x83b.google.com with SMTP id r17-20020ac842510000b02902456ec03025sf6588881qtm.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Jun 2021 07:36:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1624545402; cv=pass;
        d=google.com; s=arc-20160816;
        b=noUz/2WdEDuVYJnHJ8ncjtWw8hPm/6wKKSz5gy3K5f1XRyeukm+ufZRcXang3oGj4x
         jJ13v4mv7q116b39FTULjcEOgwiW0KO3KJGWfa5NXQXkc0XQdoIt1ooNEJwUftBql0Ge
         VwenjViFTCg3U/lf4EPgCndmYzkuOSdF2JTl8uPg1ox/1jV59vwrsxYRcVvDPxpMJVgy
         1XHNR6W5pVX2SNlEPf+X3qnVn8Cj/i3UltTcT9UxKzbtfE184NnCZtt9OMM+7n7mn3yj
         f6/Vu1WMGok4jk0q4bH8S5pFflD0A1LYXmoG7p4muFcPZ4B2t1i5WS1uv1Lw1pGr+971
         3t1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :sender:dkim-signature:dkim-signature;
        bh=CQEvSeokkq56VEAablNzA36QTYBJS4uDpDnswm4bSo8=;
        b=ZrUUhuL1WOrzw6Y8Oryy0hxFwvcKV5aTjsMo7cpoSVmA8gTkSFNfYeFV9g7/VpnaO9
         DsPE1vy88OtXXRu8VyWJF2kzWK1YI6rgjXOjqdXxdg1I/kU+LW0NmvE1idFFEcARxLBM
         s4CppTdqBMN0ZC/rewC1hVCzroRm09aqmGBctaYZAIOgY+SWFywnnek6gICj0dC4dF6M
         9z5RDaMVp40EsvD3zjUtYaP/x0uEkktnNFj8HQmRBsVvIe9uQgKz8dl4yITU/ww5GWdA
         CZSTTPfqlJCcyD9gAz7Mhim7tE8bsw51+yYFoHr34gZrlvk07O2egadD0exU9LG1ukgZ
         RveQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=MIqy8yHu;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::841 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CQEvSeokkq56VEAablNzA36QTYBJS4uDpDnswm4bSo8=;
        b=S+Z8qeaSDqJWJ/Yqx6EBoqe4/oN5XFWR9/CfLOvnJ3naAJvHMcp80RvufiSonWZzU0
         5G/IwazkHqvrCRylIqJh/SSTA5sNFotA5vLfGclD2AJYSfma26Em1XYTVrikuYHqhxBQ
         QSeAKQ0vvoswGL1lAB72fKDprgPNaEnfjL6HTQsx6BmjfEb8mzOnYao1ewWuoUivMv0Y
         X8Lhazt9oK1kh6Wh0YxhDGU2NCEEyo+GwlHIrDKGm92Nlasa9QsNVzJRJCJNLd1uJYJf
         ptvK4ho6j0wzGS7tBS/7VLRreNplOcbyDfAhGIWv99LxEHxw+CeHUFCOlTFTl7iJOGvA
         pMkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CQEvSeokkq56VEAablNzA36QTYBJS4uDpDnswm4bSo8=;
        b=rtUzbw6eseJ1NBBl1X5iOEi+EUg66rjA59DpiuYkuJHuQ7jyYUY4CU1hIXGt6A2bn1
         MWdPpLax6M1szQjFvfWPlG5dOpd7RQJarovlBlZXgjKEbSD0h1qMTqH2ovSXkl0Fr/Yi
         t1e3EoKXzFVmyQvjr8bmV2yAUHGlbag1v+eOAyJysuGhyLCLghdpZNprroWKyVZoCwAu
         2GdesmRm0TAbXckNjXANmXQRZehaaVvjUAmPeBuwgWRxBMaWTS8KkOjYI6Z12TAG8zQ5
         TECGLSMwVZtbRv81XjAb1u+LJt+FYsDoVBP1RDWWEFE3OJcvjcFJARPZ5zvLFBPxC3Ar
         Kahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=CQEvSeokkq56VEAablNzA36QTYBJS4uDpDnswm4bSo8=;
        b=f1cEgpfY8hML5v6vkLfl/rvWXNRUjhLMHvNof7BIMHahpEGyQeJSV5Y7VoGC8bv4jG
         NuohxWgSrzBBvm5SVDIx3LpTUkuYIiKDlFe4yc7yt2ixw1TQP2dVl99bQSycv2THP80t
         8FrHSWTuPtqaFc27V0RMCvJNBj+YgL6pRoVBWbMvg2CjPoKhkD0JdzUGVd4obpf/+9bq
         FQ5PPGFbASBBBIbKS4ZIsHJn0m5pl7tkRSeMpCojU6WDHmc6xbMzJxb+Yxkq1Y2p5Cy6
         A1wjqGh2+mQl57qUGEb6Nb2TwqHebCdEbb/PeV9dgjggkr3qIE5Vz6qXpCTs+lS3LPS9
         XFTA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53301+LVGZFa8G8a9/pkPp6YC472IIQv8CfNagLRxdTnGz2YOAHG
	kl++n4QgpwkpGpi0XXvknfk=
X-Google-Smtp-Source: ABdhPJyCT2x++N+1f8XPdTktWyX0w/DEw23JE8bWMps89JWXZKouPrR93WLlMXn55a5EvB83NuUDcQ==
X-Received: by 2002:a25:ec06:: with SMTP id j6mr5288173ybh.510.1624545402320;
        Thu, 24 Jun 2021 07:36:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:e091:: with SMTP id x139ls1161780ybg.8.gmail; Thu, 24
 Jun 2021 07:36:41 -0700 (PDT)
X-Received: by 2002:a05:6902:502:: with SMTP id x2mr5268757ybs.163.1624545401834;
        Thu, 24 Jun 2021 07:36:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624545401; cv=none;
        d=google.com; s=arc-20160816;
        b=p0ogk/L07oP3P5cReGcmYa4hUjEFj1bB63z1EuqofIu8sNJ+rPIfvaVSaqGTe4QtUU
         c+nGKvmr/Fpif7nteMjGxcnep0j4h5J85lw52cDRyhlFnxYPO26/qLKM5s3T2TkEl8yD
         3N3Vl/7YiiwMAY00Rhl7G70SpGB3ytXH8wZxb+IUcvWHS6Rx+4oQtg3b1y4AWTjNyHTI
         pcu3gHRsW19D/jLt9LkXviyW+7bmEBR5veg3GDUxLqqo9ZajTV2tHUDnchN5PCoCSKxo
         wm1tXqTlV3XS4K3zNLlvq42D0SSNCs5vRqhXREoNQ4torxRU8f5tM/I1A3R3FLYmPF0y
         unig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zXsdtJP73fWQjldzx0cR8BBbddZOgo/+WJFZrc6wV2c=;
        b=PBjRcWbJrmCCy8I6Bw/6Kdo+KMWM7ucqaAKNM1j8RIErA5eWj3+ulZeF5ywLQ19GdQ
         qgKGnSCaVYwopKutwGyh3uadhbd+AiMs9zzTxybIl5n5lwwND7h1W5DXJvi8o44DLQef
         hfrVJSZ7cZR6K6A2iV166V3Y1eFEs1HXGyNhppotLjEBOZWhiK0rTTwT+MBbAEq4cExU
         2jmkBetPH66S5pIJynrVf78oL9MQI86Fc1Hnu4CG7T69dY8+wC2ZvUcfp/QeHvjo113s
         c7ft5P/vv3jtVMozq2zShOnsnfS37/7yNxSGScp8XOZlUlgUiofjTHUh8/qPWyalnzDe
         KhGA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=MIqy8yHu;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::841 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com. [2607:f8b0:4864:20::841])
        by gmr-mx.google.com with ESMTPS id x199si321706ybe.5.2021.06.24.07.36.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jun 2021 07:36:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::841 as permitted sender) client-ip=2607:f8b0:4864:20::841;
Received: by mail-qt1-x841.google.com with SMTP id b3so4281183qtq.6
        for <jailhouse-dev@googlegroups.com>; Thu, 24 Jun 2021 07:36:41 -0700 (PDT)
X-Received: by 2002:ac8:5a81:: with SMTP id c1mr5146556qtc.194.1624545401665;
 Thu, 24 Jun 2021 07:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <CABSBigR3+yvpTCU2=YKYjX-ct-buuCh=WdkF9uZzT8vz=CWaHw@mail.gmail.com>
 <fd7255b3-59ca-17a3-1ce6-39dc3a8220c0@siemens.com>
In-Reply-To: <fd7255b3-59ca-17a3-1ce6-39dc3a8220c0@siemens.com>
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Thu, 24 Jun 2021 22:36:30 +0800
Message-ID: <CABSBigRFXS_d7sP86tPCGP8tGoRFRKzBU885e38aV3b_N1ticg@mail.gmail.com>
Subject: Re: adjust_irq_target() for root domain
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: gengdongjiu1@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=MIqy8yHu;       spf=pass
 (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::841
 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;       dmarc=pass
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

Jan Kiszka <jan.kiszka@siemens.com> =E4=BA=8E2021=E5=B9=B46=E6=9C=8822=E6=
=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=889:47=E5=86=99=E9=81=93=EF=BC=9A
>
> On 22.06.21 14:17, Dongjiu Geng wrote:
> > Hi=EF=BC=8C
> >    when the Jailhouse hypervisor is enabled in first time,
> > "cell_added_removed =3D=3D root_cell" the  irqchip.adjust_irq_target()
> > will execute two times, it seems there is no need to execute two
> > times, maybe it is better to add a judgement to avoid it?
> >
> > void irqchip_config_commit(struct cell *cell_added_removed)
> > {
> >         unsigned int n;
> >
> >         if (!cell_added_removed)
> >                 return;
> >
> >         for (n =3D 32; n < sizeof(cell_added_removed->arch.irq_bitmap) =
* 8; n++) {
> >                 if (irqchip_irq_in_cell(cell_added_removed, n)) {
> >                         irqchip.adjust_irq_target(cell_added_removed, n=
);
> >                 }
> >                 if (irqchip_irq_in_cell(&root_cell, n)) {
> >                         irqchip.adjust_irq_target(&root_cell, n);
> >                 }
> >         }
> > }
> >
>
> Looks like a valid optimization, provided cell_added_removed =3D=3D
> root_cell happens in reality (I don't recall from the top of my head
> right now). Please validate and then possibly suggest a patch.

Ok, got it

>
> Jan
>
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CABSBigRFXS_d7sP86tPCGP8tGoRFRKzBU885e38aV3b_N1ticg%40mail.gm=
ail.com.
