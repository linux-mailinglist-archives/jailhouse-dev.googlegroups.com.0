Return-Path: <jailhouse-dev+bncBDPODWHAYYOBBHOBQ6DAMGQE5FFW2LA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x737.google.com (mail-qk1-x737.google.com [IPv6:2607:f8b0:4864:20::737])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BB43A28BB
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Jun 2021 11:51:26 +0200 (CEST)
Received: by mail-qk1-x737.google.com with SMTP id k16-20020ae9f1100000b02903aa0311ef7bsf15859881qkg.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Jun 2021 02:51:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623318685; cv=pass;
        d=google.com; s=arc-20160816;
        b=Z0XcNAaluUQb4ECOuEm1egFvT+yVxqmErKpP/0B0anShdJ4OIzM++M0SReH5fCi6Or
         q7AUCbLLxjUu2DYdMClsvZkAn0udNOjw45mZPtw8sKbzSVZkoMPvytUBP0Nts0KX8GK8
         82L2DtOVJr/N87CSgCnQCIt7WW2YRz1uzBko3jGGTrskYL3OiTOZ/bN5OTS57tbBCSjA
         DXvY6ISmJ4v/cUMIEb5wp9SEIJsktevbamZBrFNXoqgP83y0OarcooJwnHNK/P6rc/W9
         YJuIi+pNYpPYPW56BGV/9AGP99bAkVrHlOuJkiqasSuzTl2fM1G8Ur7hWJku5NtW84zA
         N5iQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=LAFBsttiVtAkNvq6rj0gTanvnf1ufB6Oc4yvGxuw0w8=;
        b=EXtd+lHTDvxkVGg8MeO0i9mlgu4U86d9qPe9JpCzPVF77tRV7+7M7PF2CA3woMd9ML
         tjCJCsNH+26fjRCTl9Qua856VqvtAUVtrJlpYb5Zj0CdzRMnxCUrRWnyJZEPs+XKOTm/
         ya6lUpjib89SXGbTUuz+x6bbI8F/02jwat/s9qmpk5XYAiWZ6wLnUyx6oZokBHuaf9+4
         FD/DtElfXI0Srw1LBzK3RnCTTmV/MS7QydZdjbfttxKw6l5U2NVGaMHGbQ0TcIUsijQr
         3CnYhpPvctoidVbhgUioPRTiUNkn7lFWJTc7OEX0knIYQ6SAzArpKixFMcQVZ0tWY8Ky
         q+WQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=SJQxiJTZ;
       spf=pass (google.com: domain of gurrieristefano@gmail.com designates 2607:f8b0:4864:20::a2d as permitted sender) smtp.mailfrom=gurrieristefano@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LAFBsttiVtAkNvq6rj0gTanvnf1ufB6Oc4yvGxuw0w8=;
        b=MAm6WwRe8ExEDe8ru3CihTCYdNjSAVxe+ehBWGr+GPJz0HSrljYaAIvr6BO1O+AfAM
         Z9UMMSv1JJO03pyuy8cvAMobHtFKTHvsyKf6ZFiJ3kfnuElhVg1xC5ozTpDeEhu1jvCy
         qbXSCgGl1ZIzDXEWApiV3j+bkQEgzI7iqstYaaB3vIzKVA66rnXp0Il3drAxWEZeeIlU
         nA2qvVqCQ2zS//XyLRkXN9WVN9wEnROyQbvyqA+NUgi9tLYez9eur+t/n2LaCLwLD+b2
         DDukMarzK5u3ZcwsPTG5FDTosZRcS/J+yvToKzn01IybVysruDc53iggsmk+0v1TI1Mg
         e9Gw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LAFBsttiVtAkNvq6rj0gTanvnf1ufB6Oc4yvGxuw0w8=;
        b=c1jCpP9G504Cv5LKAHiknivMmkLfOOtA6UCUEEPr83Gat5aFQwObrEhFsHdBtpjApk
         m2HDw+LExNdoToMFtk30rZruBzZPaW4e3V/K69E7gwjgf1hY0s/CNsG8T1lDrL0Z8oUh
         X7Bf7o5Q56LlWdl+GNW4cvny8or9iunXaTTqE0Rx74jcxLQmRBrO5tlY4q6D4iaz8SDF
         3lmzuoVppfGZSI/hrY5USt1JJXj7Ou1J9kJbkqekkOmlu3BIAUAlIKj7Lw0ghvcCpv2a
         DLSYw8+5uEtQlXsUsqjRRm/4VIenfVkuVN8ZZA1moJcbywcz633OSftdxRD3rMIfuf4s
         LKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LAFBsttiVtAkNvq6rj0gTanvnf1ufB6Oc4yvGxuw0w8=;
        b=C0SY2swcbvDLvx8CsMHsJ/jZUSf4xra9jFYgP8t1oXtuf5GokZ9D7WuHe9KUvNiLWK
         iHKdSOcJh8WtFwue9TCZKUxj8+i5atcypoz3RLu+vlHc2wThhT954kQvF0M0E6Cm2deI
         iTPHyl/Ta0Nv7wdK52RVCbQ6Eg5M5KOJZ2hdh+rfQoo/iHRUeViJdHJx2aTLTTERdjCX
         8aiDxR/2P/9uX7vzqV7HXoAE9PNhxQXJgk3IZ/7V4RZbV35s3OaOY9qcEouVK7n2oZJc
         Y/dnJl6ciTTtccmv9bRvaO4DcUDxjHMWJ0ZMO6HKa+uJG2PhzsKUelIb+8kk1gQikzzo
         VFDw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531n0rk6wLkv1mJAibAyWiarNu6wS4wEUht1VoJagPu/G14TyowR
	E1TWofKmpQ2by1JxXb6ElVQ=
X-Google-Smtp-Source: ABdhPJyZT9WvRDdvTVETk7BtgEf6qsb49f0kwp2paiMcPPXgVbkHuQQ/t7b8jtWav2Vp7nyejRsO8w==
X-Received: by 2002:a37:8507:: with SMTP id h7mr3609744qkd.277.1623318685673;
        Thu, 10 Jun 2021 02:51:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:4049:: with SMTP id i9ls2959472qko.5.gmail; Thu, 10
 Jun 2021 02:51:25 -0700 (PDT)
X-Received: by 2002:a37:a115:: with SMTP id k21mr3713069qke.255.1623318685231;
        Thu, 10 Jun 2021 02:51:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623318685; cv=none;
        d=google.com; s=arc-20160816;
        b=cc+WOnuhQCQCnja5YbDuX1Yf+bwaZ9Bp6gUZgVSmsEDWC8Cetc2ngxozqj6/ECh7rP
         7BLpDMORC8X5+T5JqPjkVCB2ZboQJ6sBzzlmOGuSgLkSIgegxdjBmkVrc0Tuz7sCOwoA
         /bMXZ4Ds6HTSm5osaOdo9edDSz44DD//kXmNVzdm4NvHvptj6YeOpDSRAegY/M8SO80v
         uQoPSytZQzAqINDphi5YbzlT3lyZHuvf7GbHJ5aWf4HEB+D1JOhe5+XiJLRuammMuapd
         DEpIAdtz8Afn1D3kkKJj4Ms5QfT15H2sdqzt4TTwFXCFTUcP1tNpWqCYqIAqTIGY1eBU
         pwDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Qz7fIxmTiV01DsLWNJqTfTLSZZidqhOrS2FWaAIZeTc=;
        b=s5UwPg8Fv1fzUmDRGkxp1yQSJIPOmMMJ/IdWQC4Klf6hrw81aN8/ivn5bDY+qb9lNb
         EeLtLY1bhknCY2Qrq7zR7gS5aQ+NMPdodinJ2ncI1KwNXeL7XvAEwqmSMU1y0uV2CV5w
         jBtt7W/Rb3viPQJ0dTPlri/jqGZc7jSgFKHeOzYAzH5foKD/IgDZ8VXnPeQjsyDi5OLr
         DZ2gWMvuhUofEAfAKAhsCBP+31H7qfBuH1Y8NIzAHGcM2G9htuirsie6ntNVDSM+kKt9
         BsL9lutq3nnyPFbx+a3pm7hHnMA9mXOVmdg0oN+j0eHhXtcR/vz50ErIY5BzvEBWZtAW
         SvCw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=SJQxiJTZ;
       spf=pass (google.com: domain of gurrieristefano@gmail.com designates 2607:f8b0:4864:20::a2d as permitted sender) smtp.mailfrom=gurrieristefano@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com. [2607:f8b0:4864:20::a2d])
        by gmr-mx.google.com with ESMTPS id b12si332943qka.4.2021.06.10.02.51.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jun 2021 02:51:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of gurrieristefano@gmail.com designates 2607:f8b0:4864:20::a2d as permitted sender) client-ip=2607:f8b0:4864:20::a2d;
Received: by mail-vk1-xa2d.google.com with SMTP id c17so1627915vke.3
        for <jailhouse-dev@googlegroups.com>; Thu, 10 Jun 2021 02:51:25 -0700 (PDT)
X-Received: by 2002:a1f:eac6:: with SMTP id i189mr3153758vkh.3.1623318684687;
 Thu, 10 Jun 2021 02:51:24 -0700 (PDT)
MIME-Version: 1.0
References: <d56ce2d8-9299-47e2-80b6-eea428b62f70n@googlegroups.com> <0d8757b9-c2f7-266f-8ded-709c632f955d@siemens.com>
In-Reply-To: <0d8757b9-c2f7-266f-8ded-709c632f955d@siemens.com>
From: Stefano Gurrieri <gurrieristefano@gmail.com>
Date: Thu, 10 Jun 2021 11:51:13 +0200
Message-ID: <CAKpvFF10mGXWcmgj+=Qy4ypi39cB-wQdtLVzn6OwppOtuLms7g@mail.gmail.com>
Subject: Re: Understanding Jailhouse partitionning on persistent memory
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: laurent gauty <lgauty@gmail.com>, Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="0000000000008ee05e05c466556a"
X-Original-Sender: gurrieristefano@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=SJQxiJTZ;       spf=pass
 (google.com: domain of gurrieristefano@gmail.com designates
 2607:f8b0:4864:20::a2d as permitted sender) smtp.mailfrom=gurrieristefano@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--0000000000008ee05e05c466556a
Content-Type: text/plain; charset="UTF-8"

Hi Jan,

so if I wanted to start a second Linux inmate cell and mount a rootFS
installed on the second partition of my eMMC (/dev/mmcblk2p2) is it
feasible or not? It's not still much clear...sorry.
What do you mean *"In that case, you need one cell taking ownership of the
controller, serving other cells as proxy."*?

Kind Regards.
Stefano

Il giorno gio 10 giu 2021 alle ore 10:53 Jan Kiszka <jan.kiszka@siemens.com>
ha scritto:

> On 10.06.21 09:47, laurent gauty wrote:
> > Hi,
> >
> > I'm currently playing with a NXP dev board based on iMX8Mplus. I'm very
> > interested by the approach you have developed in the jailhouse project
> > in order to segregate different cells running different systems.
> > But as i tried to install jailhouse and played with cells, i reached a
> > point where i don't understand how jailhouse in intend to behave on
> > persistent memory (i.e. eMMC / SD).
> >
> > The current configuration is to have several cells using the same SD
> > card / eMMC, but relying on different partitions. And i think that most
> > of the projects in embedded world will have to deal with only one memory
> > device (SD, eMMC) for cost and space reasons.
> >
> > So here is my question:
> > is there a way in jailhouse to isolate the persistent memory (for
> > example partition) of each cells from each others ?
> > If not existing today, do you plan for this kind of features in the
> future ?
> >
>
> The general issue with partitioning of storage is the partitioning of
> the device access methods to it. With something like AHCI, NVMe or MMC,
> you have to go through a central point, the controller, in order to talk
> to different partitions of the same medium. In that case, you need one
> cell taking ownership of the controller, serving other cells as proxy.
> That would be the Jailhouse model of it: no device driver in the
> hypervisor, rather using a cell as driver. To provide virtual access on
> the physical storage, something like virtio-over-shmem + virtio-block
> could be a pattern (though not yet production-grade). Or storage over
> (virtual) network.
>
> An alternative to the proxy cell could be if you have a directly
> memory-mappable storage that does not require coordinated access on a
> central controller. Or if you had something like SR-IOV capable storage
> controllers that could present themselves as multiple, thus
> hardware-partitionable, devices to the host. None of both we've seen or
> tried so far.
>
> HTH,
> Jan
>
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
>
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/0d8757b9-c2f7-266f-8ded-709c632f955d%40siemens.com
> .
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAKpvFF10mGXWcmgj%2B%3DQy4ypi39cB-wQdtLVzn6OwppOtuLms7g%40mail.gmail.com.

--0000000000008ee05e05c466556a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jan,<div><br></div><div>so if I wanted to start a secon=
d Linux inmate cell and mount a rootFS installed on the second partition of=
 my eMMC (/dev/mmcblk2p2) is it feasible or not? It&#39;s not still much cl=
ear...sorry.</div><div>What do you mean <i>&quot;In that case, you need one=
 cell taking ownership of the controller, <b>serving other cells as proxy</=
b>.&quot;</i>?</div><div><br></div><div>Kind Regards.<br>Stefano</div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il gi=
orno gio 10 giu 2021 alle ore 10:53 Jan Kiszka &lt;<a href=3D"mailto:jan.ki=
szka@siemens.com">jan.kiszka@siemens.com</a>&gt; ha scritto:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">On 10.06.21 09:47, laurent gau=
ty wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; I&#39;m currently playing with a NXP dev board based on iMX8Mplus. I&#=
39;m very<br>
&gt; interested by the approach you have developed in the jailhouse project=
<br>
&gt; in order to segregate different cells running different systems.<br>
&gt; But as i tried to install jailhouse and played with cells, i reached a=
<br>
&gt; point where i don&#39;t understand how jailhouse in intend to behave o=
n<br>
&gt; persistent memory (i.e. eMMC / SD).<br>
&gt; <br>
&gt; The current configuration is to have several cells using the same SD<b=
r>
&gt; card / eMMC, but relying on different partitions. And i think that mos=
t<br>
&gt; of the projects in embedded world will have to deal with only one memo=
ry<br>
&gt; device (SD, eMMC) for cost and space reasons.<br>
&gt; <br>
&gt; So here is my question:<br>
&gt; is there a way in jailhouse to isolate the persistent memory (for<br>
&gt; example partition) of each cells from each others ?<br>
&gt; If not existing today, do you plan for this kind of features in the fu=
ture ?<br>
&gt; <br>
<br>
The general issue with partitioning of storage is the partitioning of<br>
the device access methods to it. With something like AHCI, NVMe or MMC,<br>
you have to go through a central point, the controller, in order to talk<br=
>
to different partitions of the same medium. In that case, you need one<br>
cell taking ownership of the controller, serving other cells as proxy.<br>
That would be the Jailhouse model of it: no device driver in the<br>
hypervisor, rather using a cell as driver. To provide virtual access on<br>
the physical storage, something like virtio-over-shmem + virtio-block<br>
could be a pattern (though not yet production-grade). Or storage over<br>
(virtual) network.<br>
<br>
An alternative to the proxy cell could be if you have a directly<br>
memory-mappable storage that does not require coordinated access on a<br>
central controller. Or if you had something like SR-IOV capable storage<br>
controllers that could present themselves as multiple, thus<br>
hardware-partitionable, devices to the host. None of both we&#39;ve seen or=
<br>
tried so far.<br>
<br>
HTH,<br>
Jan<br>
<br>
-- <br>
Siemens AG, T RDA IOT<br>
Corporate Competence Center Embedded Linux<br>
<br>
-- <br>
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com" tar=
get=3D"_blank">jailhouse-dev+unsubscribe@googlegroups.com</a>.<br>
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/0d8757b9-c2f7-266f-8ded-709c632f955d%40siemens.com=
" rel=3D"noreferrer" target=3D"_blank">https://groups.google.com/d/msgid/ja=
ilhouse-dev/0d8757b9-c2f7-266f-8ded-709c632f955d%40siemens.com</a>.<br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAKpvFF10mGXWcmgj%2B%3DQy4ypi39cB-wQdtLVzn6OwppOtu=
Lms7g%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://grou=
ps.google.com/d/msgid/jailhouse-dev/CAKpvFF10mGXWcmgj%2B%3DQy4ypi39cB-wQdtL=
Vzn6OwppOtuLms7g%40mail.gmail.com</a>.<br />

--0000000000008ee05e05c466556a--
