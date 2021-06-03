Return-Path: <jailhouse-dev+bncBD2KJCOQRYJRBS7M4KCQMGQE2CMAOUI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33c.google.com (mail-ot1-x33c.google.com [IPv6:2607:f8b0:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 74406399F63
	for <lists+jailhouse-dev@lfdr.de>; Thu,  3 Jun 2021 13:00:29 +0200 (CEST)
Received: by mail-ot1-x33c.google.com with SMTP id 88-20020a9d06e10000b029030513a66c79sf3059897otx.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Jun 2021 04:00:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1622718028; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZZq7/Vstb2CjXlLz+VoCq+igFeeJkSRJFjVWqLv2kOLZk9K940QPHotP7r/7yPTvC6
         XFf/OcQY6byRtGNVMHtVPm0imAjQdDrEAbeXNH8iofdNzSSR5uIWEyDcM+YvVCqe4QA7
         oUxg4ePBN1rXjQ+SOVhpneh0O0kt7Dtv1hHYusBQCwKXhuPA9uH2qtugZFmknqrFJbbQ
         X+9U08PpzHHgPS1bJiYARleeniRodcQTdHj0//NJgQZLVj/qziUmY5Aw7N2WtIGcTlzm
         rNp0wavSYrlHG4FXL/BFDFt7VWw0/eybneNuLTQjD13Wlb1atOmX3fvmzyCz4J8NXtc4
         ebig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature;
        bh=LBtQImVnmK/KlaoOJGRwluq+d7jCDQ68K1QNYh2sl7s=;
        b=1K0YF+1QyuVRLrBNU7lrHEjYK7ZUsu9tGj6u2Q4Azo7/Spe/aSMflhxii1txdtEU3u
         Vg7VFHnVZarG1frUIwrt82TZfay2fQpUBZ5TVFAnTQLKHSWgg2O3fPhQ/CZFD0aXZf3e
         4GAZH+0LzgqJ4vndCZspMSgEkKGaeokgYgqmvCg4u9v0KdwNcbLYfT6MonXYzLGFOibt
         a8HhojPeUTXB5qntMfTul/YdkeoYScYponKCoSTgqy9JnfTp7d/l3g/Et8cBla4aC96y
         Fyq17+frcxDUaBCCR0jaVtx/Ec12KQrl9fE0Z7UnQLssFepGUGQsUKFe2VBikbU+1B+Q
         n/0Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@cimware-in.20150623.gappssmtp.com header.s=20150623 header.b=tJeUYp6c;
       spf=pass (google.com: domain of kannan@cimware.in designates 2607:f8b0:4864:20::d2f as permitted sender) smtp.mailfrom=kannan@cimware.in
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LBtQImVnmK/KlaoOJGRwluq+d7jCDQ68K1QNYh2sl7s=;
        b=iGtuWhURm1Xs4BCpKtlYdLSEnVxCA/RZL5GtEXjZ/X8/HzazwSwB76mNkSVRH8KrRo
         Ts9MYsp3LaH0zOM6UWQwMmTL8W0c/kULk9MJvEPpPd4lWuHV8j3OTf3yvr4E24USGEt/
         Nx1W+9JxPF2xCSSrS9B+QwUpFWz/J7kaR+eEwLr4uz2i4xQ1wPnVkToXFVDTTqDEivjo
         HQPOHNwwhYeE4k0r1p3BXO0EEfqOcWiWDFy212O2DQnPH6N606ldKgTtLSwIyb/uZjg5
         vVsUpzZR9htmXrW0w3J4EqmuCP8x8TlJQLnvHlY1VD5NYAV9pO+2XhCn2oFOa+5z/uXW
         770g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LBtQImVnmK/KlaoOJGRwluq+d7jCDQ68K1QNYh2sl7s=;
        b=moNAad+wGmFX4dD9+0b142AEw+yRzWoDfSMKt0g9OGZztBxqJYQiUmKratAe95YN73
         CL8Hq4aQyS+QhN+Mh6Z5asQr2asbV/oQeO0kn+tHEFGfe/+ddzRziLOx6hUo+zB/NHiF
         pEZHM+k/ZxEe4hdAUaY+AgHmCnJvZSPTOiCvbmJTFevACHYHVciHLERqi3MhFplH2Jcz
         o9OHhJGAiL2xgv/0VhRsCZkgHX/UQHxckGbmgwKOINVSwnX2+8YEKRHJf7cnUWZdvmZ7
         izHqiz8MlJrvZdmLM5Az5SV5xCF5r9UpUEgr7sHHXFHx3oK+vyE5k7rSDPU2EXAEDb8c
         pJbQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5333V54N6ru7nqO3ysr1rxbV4wQ0prnRVb2TJU8rQAyHQb0FcHDq
	Du91hSGnYP1gX1MppeB7WaU=
X-Google-Smtp-Source: ABdhPJyUqDrVtfcOaXvY7EUThhWw+agHiiM5mnXPTxnqV1/CgU+u54h7ayqHXjGI5EEEqbO/zWo/Tw==
X-Received: by 2002:a4a:7506:: with SMTP id j6mr28325964ooc.79.1622718027633;
        Thu, 03 Jun 2021 04:00:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:7b46:: with SMTP id f6ls967450oto.2.gmail; Thu, 03 Jun
 2021 04:00:26 -0700 (PDT)
X-Received: by 2002:a05:6830:1518:: with SMTP id k24mr28433399otp.40.1622718026875;
        Thu, 03 Jun 2021 04:00:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622718026; cv=none;
        d=google.com; s=arc-20160816;
        b=pvCJTE8yZMdjNosJvzovNzkjxMA9IRSJPBeGt5kqx91ghUla9omEWjMo2OzEp9vwLd
         fcfG7J2fsoZHKGHF3tau8G0B2bIwPHiOUTc0JajH4RvRfm92ZPjwXHQixkZ+Sy6ppcYU
         FEfg8QGLd3dFOkbzp3uEYDamrpe6UJhtEynJWxq5T5yXSmc0i2kV2tj8ZKeVkBlMa2mO
         w6b+yuPfJMIAwZMm0XUV0E75v+sOWNlJoZzQw4nIarx01BSpTZx6KC0jnQ2al0LaV7kt
         yl2BoiyRBJkkdOreHW4o2mAfAkRD4H04iOBsZ7EuJit0pU75cSCODpRCvy/5rxfuQ3gk
         2VLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=qq5YKLkulmfGgun7hY79u/EwqQEI5nMrsc6bPJqwxZ0=;
        b=qIHgcT7Gt3MymnBjq+cr9x6VnKGydA3Hy5VUGOIbq2Bjc4T6qAaClHaMHnGI1EUPH7
         0Wjh3eHBZXc1NlhhYHMGgE0mvJSx1y0xTBoYugTXrn6QJjzWzOx3PPW5+oYpQY0FmSas
         JWBVwkVKD2pmHiZwUT4IJzTtiAi6d9VNQct1VTxcRmYxcyhk9CDBYvbqphcV16o7Oc/f
         V0LbuJfXgu+5BScPSk7CGQ6v7h8WY4njXSGN+NgEWntAGF4kPGds6FPuBuMnNOSvoq2A
         KF+7HghkinZVZ2caxXt8IzO+CA4cfJQFa7S0nCgqGJyzydlOG6QKAYl5+Oopho+zEJlZ
         S02Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@cimware-in.20150623.gappssmtp.com header.s=20150623 header.b=tJeUYp6c;
       spf=pass (google.com: domain of kannan@cimware.in designates 2607:f8b0:4864:20::d2f as permitted sender) smtp.mailfrom=kannan@cimware.in
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com. [2607:f8b0:4864:20::d2f])
        by gmr-mx.google.com with ESMTPS id w16si272076oov.0.2021.06.03.04.00.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jun 2021 04:00:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of kannan@cimware.in designates 2607:f8b0:4864:20::d2f as permitted sender) client-ip=2607:f8b0:4864:20::d2f;
Received: by mail-io1-xd2f.google.com with SMTP id a8so5751259ioa.12
        for <jailhouse-dev@googlegroups.com>; Thu, 03 Jun 2021 04:00:25 -0700 (PDT)
X-Received: by 2002:a6b:5112:: with SMTP id f18mr18417948iob.142.1622718025133;
 Thu, 03 Jun 2021 04:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <09c2642b-ba89-4226-8452-534393dc6a33n@googlegroups.com>
 <d5e6079c-5cf5-ce18-45c0-d0eaa7d60350@siemens.com> <aa1b60e5-a823-4cb5-b36f-d0162bf0583en@googlegroups.com>
In-Reply-To: <aa1b60e5-a823-4cb5-b36f-d0162bf0583en@googlegroups.com>
From: Kannan Sivaraman <kannan@cimware.in>
Date: Thu, 3 Jun 2021 16:30:14 +0530
Message-ID: <CALeLWRjOz=fYGsDXfHWsHuS4Rt4HeSLXCbqvGCPi8P0fDqy27g@mail.gmail.com>
Subject: Re: How to partition PCI devices to none-root cells in rpi4b?
To: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="00000000000075899805c3da7bff"
X-Original-Sender: kannan@cimware.in
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@cimware-in.20150623.gappssmtp.com header.s=20150623
 header.b=tJeUYp6c;       spf=pass (google.com: domain of kannan@cimware.in
 designates 2607:f8b0:4864:20::d2f as permitted sender) smtp.mailfrom=kannan@cimware.in
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

--00000000000075899805c3da7bff
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear community,
   I am also interested in implementation on arm64. Has anyone in this
group deployed Jailhouse on arm64. I will be very helpful if you share the
procedure.

thanks,
Kannan


On Thu, Jun 3, 2021 at 3:32 PM along li <v6543210@gmail.com> wrote:

> So this means:  jailhouse  cann't  partition  a  PCI device  into  inmate
> on  raspberry 4 board  for now?
> If we want to partition  a PCI device  into  inmate,  we should  modify
> the source code.  Is this right?
>
>
>
>
> =E5=9C=A82021=E5=B9=B45=E6=9C=8814=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=94 UT=
C+8 =E4=B8=8B=E5=8D=886:10:37<j.kiszka...@gmail.com> =E5=86=99=E9=81=93=EF=
=BC=9A
>
>> On 14.05.21 05:08, along li wrote:
>> > Dear community,
>> >
>> > For X86 platform, the  tutorial  pdf talks some about  how to partitio=
n
>> > pci device into none-root cells.
>> > tutorial:
>> >
>> https://events.static.linuxfound.org/sites/events/files/slides/ELCE2016-=
Jailhouse-Tutorial.pdf
>> > <
>> https://events.static.linuxfound.org/sites/events/files/slides/ELCE2016-=
Jailhouse-Tutorial.pdf>
>>
>> >
>> > But how to do this in arm64 platforms, there is no  document.
>> >
>> > Well how to do this, Are there  some configuration demos ?
>> >
>>
>> Plenty, though understanding the details requires a bit knowledge about
>> the respective platforms. If you look at
>> configs/arm64/zynqmp-zcu102-linux-demo.c, e.g., you can see that it gets
>> a UART assigned by handing over the MMIO region and (IIRC) GIC IRQ 54.
>> But, as I already explained, there can be more complex challenges when
>> you also need to enable / clock the respective device, and those
>> controls are shared with the root cell.
>>
>> Jan
>>
>> --
>> Siemens AG, T RDA IOT
>> Corporate Competence Center Embedded Linux
>>
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/aa1b60e5-a823-4cb5-b36f-d=
0162bf0583en%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/aa1b60e5-a823-4cb5-b36f-=
d0162bf0583en%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>
> .
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CALeLWRjOz%3DfYGsDXfHWsHuS4Rt4HeSLXCbqvGCPi8P0fDqy27g%40mail.=
gmail.com.

--00000000000075899805c3da7bff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dear community,<div>=C2=A0 =C2=A0I am also interested in i=
mplementation on arm64. Has anyone in this group deployed Jailhouse on arm6=
4.=C2=A0I will be very helpful if you share the procedure.</div><div><br></=
div><div>thanks,</div><div>Kannan</div><div><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 3, 2021 =
at 3:32 PM along li &lt;<a href=3D"mailto:v6543210@gmail.com">v6543210@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">So=C2=A0this=C2=A0means:=C2=A0 jailhouse=C2=A0 cann&#39;t=C2=A0 partit=
ion=C2=A0 a=C2=A0 PCI device=C2=A0 into=C2=A0 inmate=C2=A0 on=C2=A0 raspber=
ry 4 board=C2=A0 for now?<div>If we want to partition=C2=A0 a PCI device=C2=
=A0 into=C2=A0 inmate,=C2=A0 we should=C2=A0 modify the source code.=C2=A0 =
Is this right?</div><div><br></div><div>=C2=A0</div><div><br><br></div><div=
 class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">=E5=9C=A82021=
=E5=B9=B45=E6=9C=8814=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=94 UTC+8 =E4=B8=8B=
=E5=8D=886:10:37&lt;<a href=3D"mailto:j.kiszka...@gmail.com" target=3D"_bla=
nk">j.kiszka...@gmail.com</a>&gt; =E5=86=99=E9=81=93=EF=BC=9A<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On 14.05.21 05:08, along li w=
rote:
<br>&gt; Dear community,
<br>&gt;=20
<br>&gt; For X86 platform, the=C2=A0 tutorial=C2=A0 pdf talks some about=C2=
=A0 how to partition
<br>&gt; pci device into none-root cells.=C2=A0 =C2=A0 =C2=A0
<br>&gt; tutorial:=C2=A0
<br>&gt; =C2=A0<a href=3D"https://events.static.linuxfound.org/sites/events=
/files/slides/ELCE2016-Jailhouse-Tutorial.pdf" rel=3D"nofollow" target=3D"_=
blank">https://events.static.linuxfound.org/sites/events/files/slides/ELCE2=
016-Jailhouse-Tutorial.pdf</a>
<br>&gt; &lt;<a href=3D"https://events.static.linuxfound.org/sites/events/f=
iles/slides/ELCE2016-Jailhouse-Tutorial.pdf" rel=3D"nofollow" target=3D"_bl=
ank">https://events.static.linuxfound.org/sites/events/files/slides/ELCE201=
6-Jailhouse-Tutorial.pdf</a>&gt;
<br>&gt;=20
<br>&gt; But how to do this in arm64 platforms, there is no=C2=A0 document.
<br>&gt;=20
<br>&gt; Well how to do this, Are there=C2=A0 some configuration demos ?
<br>&gt;=20
<br>
<br>Plenty, though understanding the details requires a bit knowledge about
<br>the respective platforms. If you look at
<br>configs/arm64/zynqmp-zcu102-linux-demo.c, e.g., you can see that it get=
s
<br>a UART assigned by handing over the MMIO region and (IIRC) GIC IRQ 54.
<br>But, as I already explained, there can be more complex challenges when
<br>you also need to enable / clock the respective device, and those
<br>controls are shared with the root cell.
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, T RDA IOT
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div>

<p></p>

-- <br>
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com" targe=
t=3D"_blank">jailhouse-dev+unsubscribe@googlegroups.com</a>.<br>
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/aa1b60e5-a823-4cb5-b36f-d0162bf0583en%40googlegrou=
ps.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_blank">https:=
//groups.google.com/d/msgid/jailhouse-dev/aa1b60e5-a823-4cb5-b36f-d0162bf05=
83en%40googlegroups.com</a>.<br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CALeLWRjOz%3DfYGsDXfHWsHuS4Rt4HeSLXCbqvGCPi8P0fDqy=
27g%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CALeLWRjOz%3DfYGsDXfHWsHuS4Rt4HeSLXCbqvGC=
Pi8P0fDqy27g%40mail.gmail.com</a>.<br />

--00000000000075899805c3da7bff--
