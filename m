Return-Path: <jailhouse-dev+bncBDPPNXPMWEHBBBHHYKKAMGQE6CEIBFA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd40.google.com (mail-io1-xd40.google.com [IPv6:2607:f8b0:4864:20::d40])
	by mail.lfdr.de (Postfix) with ESMTPS id 51034535F1D
	for <lists+jailhouse-dev@lfdr.de>; Fri, 27 May 2022 13:18:30 +0200 (CEST)
Received: by mail-io1-xd40.google.com with SMTP id r188-20020a6b2bc5000000b0065fc8f23866sf2590289ior.16
        for <lists+jailhouse-dev@lfdr.de>; Fri, 27 May 2022 04:18:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1653650309; cv=pass;
        d=google.com; s=arc-20160816;
        b=rLMbNqz00tu7GdiEjoEX309zifMzmN8zCWinkU1kIN5fRyhI0LBpXJ6jE1u9EKpYfM
         xqxkDr4hQsiGIFUOJdxbYAjRCcZ5rxfNmE2JaGTkkTQbP1trkD6RnScfx2LlE5lNSQHY
         TV6m1GOHD0sJBKeJ/0VvlCkR1gw4m+mG7JSjBuFJZFsFWE21IXFn0VCbDBKieZRmKJwj
         +T73J9GXG13n1equ740Kcht07ZonAXDmFX0WA1pSy1slTQgCFwkTldo7MRmchA88WJOG
         v73r0iYK/r5UUBEOrBjaPo0tLDKBjPG/MXxKZ0zyn5EmRcFg7sipCSoC5Nk744DHJVqD
         jtlQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=rfAx/A75ERAvgfQUYGBw3pvky4Q7QtvMGYzYMe+cE7Y=;
        b=E1KAJRDnRnvNRJU6yQr5vN7b8KoeLlHz19K/FTRsyM4xPgiSaOizyjJaT9M0cWDr7h
         M10At5N+OukSeL16T415/oqvP/YXzQqZ/d7S8jhEWh9ek2LOoy06idZdaXaUjnSBTYOk
         myHOMY+aLmvamQDSH+NVUcCx0gI/VmmqEKb8cDbmauEY0kYHdw6UpQoc0E2ir7YkUt6J
         L2gmfy7VzwJTyRTfEdsPz8xg0k1ssc9f3dfQHRV0XK4ThPdCDAlvo6D6ahH98PCf8BiD
         W3j5FsH7mWo2YFUH0QSAPfqGpHP6e4Oy9I9t2EvgncB8R2XXnccXgIaKsBPNOtX7lZao
         0nNQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=GGymUzrj;
       spf=pass (google.com: domain of andreas.orfanos@gmail.com designates 2607:f8b0:4864:20::b33 as permitted sender) smtp.mailfrom=andreas.orfanos@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rfAx/A75ERAvgfQUYGBw3pvky4Q7QtvMGYzYMe+cE7Y=;
        b=JXCKLiMywTbiY1fUWdysgIp2s9p7Rf0LOZiDCTGofEiVjmXy8fw5R89Zq9X+Emsnx+
         RVOcn7rVH5ju31x/PakV6RMzha6J4iSD+TjiczH369rmBNz8G2qvYBp0uVglieO6LXSC
         o8PrdNMnHQvgX8rHdVmMFUHOLycGusJzYA2zFk3guMH4O7baeYy9O/yhkABqXDGN1FO7
         FFzQvcOpSHtH30HGZyys5tzAj3vpnhP6C3dn1ohrQHfzc6wNzEhGuc7aoedejYB3I/yH
         kw38OpEvHpVVaByPTVIGw0vLQJsdGhCjZX6PpuxgVqjum3AszIVldVosogOc1jD6RR3R
         2MgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rfAx/A75ERAvgfQUYGBw3pvky4Q7QtvMGYzYMe+cE7Y=;
        b=h/bzKwQnNSes79E6unrs8guNvZSHUigeAWL17eOeOVFznLBd7Do91+DfQ9riMn0sXp
         Uil8WrTOGyilqtYge1eEja4WBI5RMic1ylESq7dyasfLmItHAukRzdPcxwfcdRYSSnhS
         974Ob5cdot1x6vcN5pNauqB0kQsg1JMTh+GKQq9S9MhDH7QztEa/OPD2eExTOAVM6P4x
         KD5tm8Oi3sIbTSmj20x0dGRACeER5DiUJRvPkQpan+tylrMazPLQrJ0T4u/C+yzhmBV3
         9XzgBV2HaXpAW5Q5LF4UQ6m6sHEFZS2Hj7jy7UZUrwqZ2EA+K+L1K17CnyZMoAYPfpd1
         F4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rfAx/A75ERAvgfQUYGBw3pvky4Q7QtvMGYzYMe+cE7Y=;
        b=0U5SQrHtQN26leI4ZUedK6Ewkn7M9mwf/vr+rxK8I9wPEa10jh6wrQsBkdL+lYU0rP
         kY+OAYVtCnw7qs4hODCgrdMdBnbou//E17TMTrw7Tk0goLVorJ9xXAara/SqZaBZw4Bh
         3KPrRQOL0tenpFORFYnOcleSyB2qMQX5du+uDLw1P6wp3QzriA9ZUTOMZGkUlOUGZ2kG
         wupBIn1MzDprb6JNYJnKPmKX7dx1ngst4Zc3vGaudM5oEPxu4aKw5vbsh5YXuoBZrOCm
         qu4ksF7ObyuTs35hSQwG/iXCfjRbvxRf2QUZF1Tx/BCkUbvHYMTKWNZfbQeWGim4jCXn
         S16w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530zVRf0UN9dF92fVPirYDYMLwUDw73CoUeADebgdsUFMnIvh+J6
	CniMucTSOoliavlUuT4FouA=
X-Google-Smtp-Source: ABdhPJzXGcxP2rhXoVJ6f0hyq5+1Ns254jHQh3+VDrH5btd7T5BXOvnOESRTVcA6rX8p2YeijPVasQ==
X-Received: by 2002:a6b:3f03:0:b0:65a:4236:bb3e with SMTP id m3-20020a6b3f03000000b0065a4236bb3emr19222211ioa.194.1653650309043;
        Fri, 27 May 2022 04:18:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6e02:219c:b0:2d1:bebc:dda9 with SMTP id
 j28-20020a056e02219c00b002d1bebcdda9ls1984701ila.0.gmail; Fri, 27 May 2022
 04:18:28 -0700 (PDT)
X-Received: by 2002:a05:6e02:218b:b0:2d1:1d0c:2e28 with SMTP id j11-20020a056e02218b00b002d11d0c2e28mr21462873ila.216.1653650308359;
        Fri, 27 May 2022 04:18:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653650308; cv=none;
        d=google.com; s=arc-20160816;
        b=V/WI8BVdpsbywjtIh0XU1DQdZxpF64PKBPT1aYdYPpYfNlqIbhNfgO5wAC6d1uNPBV
         F4/X0Tu5rcHeCXbYY0DNYZSlKel5FEamku3u6a3aqDRNiciVFXuF4g0rPzgKxVYJs5CZ
         J45hLtFIWGJ5OIP4/c7NXVFMlE9KCBJYohx2oXk4x1+FsMdc2NNXn9qqmwCT2f4STnAN
         uF38oaW9JAfZJ/44tXh7q+6CKBAfWMmV+zey++sx4qYyWB7HQM66IU10Bnw7SjgQqjWW
         uDlYw/EtImLx7cR+oi5nUvVxVqzf/wX0LrcmwcWskX0eGBm8PIAAf4nwfCxVLvnA+c0x
         YYeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PORer11bSdrKfULK59owPxdYafDUyeeT57YI/2QuUOQ=;
        b=YH4ZEaQ3LOTALVZeX/wKcb7gZUKUW1rYwZob0X3XJuLFBSiq7V+S8wqNR1qGIShpsd
         Jq9t/+Mp6w4+VPnhtKVHyNDB8b03fIyqi1XI1cmwEmZtzBsWwYByYtmEGtouSIuvq+i9
         Rt6NKdiQ3VNSTlgNlXOtkrnoTLzlfHhICNhSlAaaA9GEsEMrwQhfrm9H9yIVosOZv4j7
         SC0xe18dq7huhZSiyOdCzbgSYPCRwRDK84BBSiR5U7OhyKPFRcfkOMXlyxDZQmAhlMGV
         IdtypfhF5YtMq429dVolCJ4hFngor0ibEey/hmNjFcOl09pd59LVItYbYw8QQ5WCFb+T
         P0Ag==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=GGymUzrj;
       spf=pass (google.com: domain of andreas.orfanos@gmail.com designates 2607:f8b0:4864:20::b33 as permitted sender) smtp.mailfrom=andreas.orfanos@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com. [2607:f8b0:4864:20::b33])
        by gmr-mx.google.com with ESMTPS id p45-20020a02782d000000b0032b22cd5f74si93115jac.0.2022.05.27.04.18.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 May 2022 04:18:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of andreas.orfanos@gmail.com designates 2607:f8b0:4864:20::b33 as permitted sender) client-ip=2607:f8b0:4864:20::b33;
Received: by mail-yb1-xb33.google.com with SMTP id o80so7451012ybg.1
        for <jailhouse-dev@googlegroups.com>; Fri, 27 May 2022 04:18:28 -0700 (PDT)
X-Received: by 2002:a25:d80e:0:b0:64e:5903:9409 with SMTP id
 p14-20020a25d80e000000b0064e59039409mr40234939ybg.69.1653650307963; Fri, 27
 May 2022 04:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <6740e6fd-5156-4aac-9e5f-1dab6ccb0fc8n@googlegroups.com> <416c28fd-5904-0b77-ede8-da1199c27df8@siemens.com>
In-Reply-To: <416c28fd-5904-0b77-ede8-da1199c27df8@siemens.com>
From: Andreas Orfanos <andreas.orfanos@gmail.com>
Date: Fri, 27 May 2022 12:18:16 +0100
Message-ID: <CADALBtqB_avg4=ac3Ek9=U7egqf8cvY8uwWJ-kt1HmX+-B6c4g@mail.gmail.com>
Subject: Re: Cache coherency with the Linux and Inmate
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="000000000000305fb505dffc77e1"
X-Original-Sender: andreas.orfanos@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=GGymUzrj;       spf=pass
 (google.com: domain of andreas.orfanos@gmail.com designates
 2607:f8b0:4864:20::b33 as permitted sender) smtp.mailfrom=andreas.orfanos@gmail.com;
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

--000000000000305fb505dffc77e1
Content-Type: text/plain; charset="UTF-8"

Thanks, Jan - Coherency works fine.



On Wed, 13 Apr 2022 at 10:16, Jan Kiszka <jan.kiszka@siemens.com> wrote:

> On 12.04.22 12:18, Andreas Orfanos wrote:
> > Hello,
> >
> > I would like to use a shared memory region between an inmate and the
> > Linux in a way that is coherent. The memory region is a memory pool
> > partitioned to provide memory blocks to inmates and to the Linux
> > processes that have mmap'ed the region. The Linux process allocate
> > blocks of memory from that region for local data processing, and then
> > indicate to the inmate that a block of data is ready for further
> > processing. The inmate takes the indication and access the shared memory
> > block with a cookie to continue further processing on the block.
> >
> > I would like to keep cache coherent between the inmate and the Linux but
> > not sure if that would work in Jail house. Do I have to clean and
> > invalidate the cache from Linux all the time when I pass the processing
> > to the inmate? I am using a Xilinx SoC with a cluster of 4xCrotex A-53
>
> Shared memory you configure between cells is just like shared memory
> between processing in the same cell - cache coherency is ensured. Just
> follow the existing examples for ivshmem devices.
>
> Jan
>
> --
> Siemens AG, Technology
> Competence Center Embedded Linux
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CADALBtqB_avg4%3Dac3Ek9%3DU7egqf8cvY8uwWJ-kt1HmX%2B-B6c4g%40mail.gmail.com.

--000000000000305fb505dffc77e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, Jan - Coherency works fine. <br></div><div><b=
r></div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Wed, 13 Apr 2022 at 10:16, Jan Kiszka &lt;<a href=
=3D"mailto:jan.kiszka@siemens.com" target=3D"_blank">jan.kiszka@siemens.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On 12.04.22 12:18, Andreas Orfanos wrote:<br>
&gt; Hello,<br>
&gt; <br>
&gt; I would like to use a shared memory region between an inmate and the<b=
r>
&gt; Linux in a way that is coherent. The memory region is a memory pool<br=
>
&gt; partitioned to provide memory blocks to inmates and to the Linux<br>
&gt; processes that have mmap&#39;ed the region. The Linux process allocate=
<br>
&gt; blocks of memory from that region for local data processing, and then<=
br>
&gt; indicate to the inmate that a block of data is ready for further<br>
&gt; processing. The inmate takes the indication and access the shared memo=
ry<br>
&gt; block with a cookie to continue further processing on the block.<br>
&gt; <br>
&gt; I would like to keep cache coherent between the inmate and the Linux b=
ut<br>
&gt; not sure if that would work in Jail house. Do I have to clean and<br>
&gt; invalidate the cache from Linux all the time when I pass the processin=
g<br>
&gt; to the inmate? I am using a Xilinx SoC with a cluster of 4xCrotex A-53=
<br>
<br>
Shared memory you configure between cells is just like shared memory<br>
between processing in the same cell - cache coherency is ensured. Just<br>
follow the existing examples for ivshmem devices.<br>
<br>
Jan<br>
<br>
-- <br>
Siemens AG, Technology<br>
Competence Center Embedded Linux<br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CADALBtqB_avg4%3Dac3Ek9%3DU7egqf8cvY8uwWJ-kt1HmX%2=
B-B6c4g%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://gr=
oups.google.com/d/msgid/jailhouse-dev/CADALBtqB_avg4%3Dac3Ek9%3DU7egqf8cvY8=
uwWJ-kt1HmX%2B-B6c4g%40mail.gmail.com</a>.<br />

--000000000000305fb505dffc77e1--
