Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBCNERGTAMGQEIDBO6FA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD6276520B
	for <lists+jailhouse-dev@lfdr.de>; Thu, 27 Jul 2023 13:16:27 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id 4fb4d7f45d1cf-52279f6305bsf529921a12.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 27 Jul 2023 04:16:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1690456586; cv=pass;
        d=google.com; s=arc-20160816;
        b=XnJE2EYS7CdJo68JrTTG0rTRWmGnPQKsAJQt3Kr+97gkfJLSwz+8Zp2+tGjyvZjMKT
         MaU2MohbnMY1WHh4iVgBsI5op8C0OEbEP/7k9cGWM2aIMdE0ABYwOhqgW4GRisTJfUc9
         ej/36yR/gRubX1/L5yXeRrjAe/qt2tBfjRgLhDMkh76loxEzyafRZL9pag1aVBk3DcOY
         vg9N796kIOj/piuWxfPDasPfHgRgYRahBR53Tt488QKgiYJW2K387RjRmZuoEK8VFh/x
         u2/mm+mL6lL2cfcB+/dZR7sHQy375b5nR6Q3VdUhHE7ebgcm48Ge4jQsmsVJuBi6wHIH
         w4OA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=0GJ/9mWbb0FYTIU2Xx+2rpeqcOEoBbRMyFHNRLAA4nI=;
        fh=FrV6cpl4HCjWBPv4bD7daMcPSJruKZfBcVW/WO33Ffk=;
        b=t2JQ/odfXPVVp20fkoUAJq+Ch+MOIP2x0q/HoIAhzK1M7vDQ1c/VJd2P5HQKKbZmgL
         W3yb8QCB81mjwB0RHwk/9V6VFV0JuwFOcRbMGB2a3K+OL4GUtT5afC7y758jai3qAQ/r
         gfQ0VxRLNvJqlxLz8kq57QgFfW5lp9meWAWMdrHY/3AkuHS+amYoNv29xx7/rpiiqZag
         ZImn+DisOL63f/vqFI6W1cFq26ZxFu9dHC4ydAkGZT3cIgBVk+r/YIIfccVdLVWNVHWx
         s4JQ9SWsQi1Q8JTnVg9eiBob3XG3rfEHGUWqalTAfrsFTZaURPcqdVwFMJ/q6u9CkbR2
         QmgQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta03-20220613 header.b=i0COhspc;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c302:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1690456586; x=1691061386;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=0GJ/9mWbb0FYTIU2Xx+2rpeqcOEoBbRMyFHNRLAA4nI=;
        b=qifdoiuVEgEtRht67T4eQbFCB9CGWW8MLwGyNovqJbhuNhWwLqhPWLAHowOQYTl12/
         O96pJ5u75nxDxnpvKfxVlyVdDmPAx7aLJn6BAnoFe98olPpRo3EHVxgFS5Golz0s3O2b
         oBpsMWOY7JTU3XapHfoD6zDIXxKSMjiNv2vknVqh/yWkE9fV0H+VfOCmROYLVotq6vtQ
         SjpBFo+Z+3mDLbCG+cj54t6+AE3/F2AD1wSZA8j4lVWiNgzfVwALfz4q4Fw0FkDArGGV
         qJACPxQ0gPjXWbTMz+YuZMzj6KBctxrZGED/Z4xKfTcssTMr9U0WRCBpCpJZOib7UnzC
         wGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690456586; x=1691061386;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GJ/9mWbb0FYTIU2Xx+2rpeqcOEoBbRMyFHNRLAA4nI=;
        b=X2dcceVZ2zXv6GDPeRtR7JPUB8DoAUn56x7I8HScBckHLs7zEqHMG6epO7N9lmZyqx
         WDLWyCSP/XWlWgSKDNvthbP5jaucj5Nl/3XWtoHXIt5+zFvDuVVPVpk1AxpwsQS933Y5
         yhj9RNfLWme0bbGcthTTmntm8uJAyRaKrD2Vu9aNvfDLh30Zf0ijVT7xwdPG9OhDgTv8
         3XcIjUGSyODQAU/CUEKRxuN3rxk19fWW3P9bsC43R+o6pWCQJZYSt5NwsyhsQ6Mw4yKK
         aeVJxAfZYXDudUwvZZcEmG5QvY17ZCmMp4LwfUYqeSm5m2MTsINLW12IaaMawF+fjQBC
         5WrQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ABy/qLbSdddUY/IJOPbo/cuJtM62YqpmjUlGiURfOjlfAx8x3caSiMBH
	78A9RhLdaRnrN09o8+nSjlJrGw==
X-Google-Smtp-Source: APBJJlEY47ZJNR7oeYIw2XJKjvFOm56SKzxT0UZ07H0gqnsBAw/GUaHia++Z8QUOpIRptKdABq8XFA==
X-Received: by 2002:aa7:c14a:0:b0:522:4200:e20b with SMTP id r10-20020aa7c14a000000b005224200e20bmr1488374edp.36.1690456586285;
        Thu, 27 Jul 2023 04:16:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:1801:b0:521:956b:b8a3 with SMTP id
 g1-20020a056402180100b00521956bb8a3ls439523edy.2.-pod-prod-03-eu; Thu, 27 Jul
 2023 04:16:24 -0700 (PDT)
X-Received: by 2002:a17:906:292:b0:988:9b29:5653 with SMTP id 18-20020a170906029200b009889b295653mr1382337ejf.77.1690456583873;
        Thu, 27 Jul 2023 04:16:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690456583; cv=none;
        d=google.com; s=arc-20160816;
        b=PJIRNCfamqgWHGECgPXA0bC1dZhuvGafFQEIwscyvgjtBmCzcdt/WOBVBDnLLAZnn1
         xfsIuYqpiPkhaNAAKsEADCEvEz4FRPomnhdvqtbV9WhoQlp0VxFSYN7HIL5jgk/7Osjq
         hQToDx3TOyjX2QYR5ZoC3uq4pamTy1t8y8pvBN0rhi/UNzp8mfqFi3zO6djO9XldoWK7
         jke7spR8gtnc9Qvx3xKACke+JBwJT3QaA/5wNnXmQt1sI5DAXV2z4AprFMcZL2X0jdWV
         zu1sDe45DVGCbViG9GEsr8c/lnttBmzNFQKNIi9kliguekjesjxvI8U2Fh8ZAQ+dbGFE
         fXEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=yg1zM7Jyw4GyfHFZ5S7e1VUc+VjGOWFs+UAt4pbPf7E=;
        fh=FrV6cpl4HCjWBPv4bD7daMcPSJruKZfBcVW/WO33Ffk=;
        b=pNSLcOCFRTSxR5i0acWJi0aJOR3xwSPoAj12agJs1RiWuuyTpYPweKe2M5qV6bv/1/
         YgQZv5rGZhmPaSxAg37FsX+2y81vcL2ozm/8eOzODD8XFv+yAYspYZQACy6531vv8wO0
         S9/taaY98oSoHWPRWrUC+u2Uo7Rd19kH99DIXbQk6SkAww4HjWrzLyVPWjCsZ5j/6BAF
         JhNrtUic6lY3QHmNSw0u9mDMZWbLyICzvqZHyd+a4cf46RZ54rYhjkF4ipVrSmTZ+lVI
         noVtAg/qNEZt77kNOwSGgUaHxXqnDBKz2JVQZ+sWf/Er1IO1KjEafpA7DXgzlk4JAuj9
         mVEw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta03-20220613 header.b=i0COhspc;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c302:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from b2752.mx.srv.dfn.de (b2752.mx.srv.dfn.de. [2001:638:d:c302:acdc:1979:2:f4])
        by gmr-mx.google.com with ESMTPS id vm2-20020a170907b68200b00991ee378a7csi73840ejc.2.2023.07.27.04.16.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 04:16:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c302:acdc:1979:2:f4 as permitted sender) client-ip=2001:638:d:c302:acdc:1979:2:f4;
Received: from mta03.hs-regensburg.de (mta03.hs-regensburg.de [194.95.104.13])
	by b2752.mx.srv.dfn.de (Postfix) with ESMTPS id 9C7203E00E6;
	Thu, 27 Jul 2023 13:16:22 +0200 (CEST)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta03.hs-regensburg.de (Postfix) with ESMTPS id 4RBSrQ2SlGzxt0;
	Thu, 27 Jul 2023 13:16:22 +0200 (CEST)
Received: from [172.16.2.23] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 27 Jul
 2023 13:16:22 +0200
Message-ID: <8e9df4fc-0fb3-5149-aba6-d7f506e902af@oth-regensburg.de>
Date: Thu, 27 Jul 2023 13:16:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Configuration with 2 guest cells
To: Jan-Marc Stranz <stranzjanmarc@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <81fa9191-18dd-4003-9cfb-bed496d5723fn@googlegroups.com>
 <faf9ae5c-7f62-5814-7453-793bffb881c3@oth-regensburg.de>
 <43f41f9d-0930-416b-a618-1955e237cc87n@googlegroups.com>
 <d5ffbbc4-d926-5bc0-e7bb-fa400875039b@oth-regensburg.de>
 <57a4477a-2c32-49ef-8ccc-e95e1d9fb815n@googlegroups.com>
 <27f131ff-b744-05fc-0e81-bd2b1267d394@oth-regensburg.de>
 <10922b18-30e5-414e-8d85-7e1f33f2f9fan@googlegroups.com>
Content-Language: en-US
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <10922b18-30e5-414e-8d85-7e1f33f2f9fan@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta03-20220613 header.b=i0COhspc;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:d:c302:acdc:1979:2:f4 as permitted sender)
 smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=oth-regensburg.de
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



On 27/07/2023 10:58, Jan-Marc Stranz wrote:
> Hello Ralf!
>=20
> Thank you very much for the explanations!
>=20
> I wonder now that if the hypervisor now has to handle a very large page=
=20
> table, the timing behavior of an application in the guest cell will be=20
> negatively affected.

Of course, can be.

>=20
> Could this then be optimized, e.g. using "huge pages"?

Yes. Depending on the alignment, Jailhouse will automatically try to map=20
huge pages, if possible.

> Is there a description for this?

See here for x86 paging mechanisms:

https://github.com/siemens/jailhouse/blob/master/hypervisor/arch/x86/paging=
.c#L134C4-L134C35

Besides 4k pages, you also have 2M and 1G pages. However, 1G pages=20
require, that the physical and virtual address are 1G-aligned.

   Ralf


>=20
> Thanks
> Jan.
>=20
> Ralf Ramsauer schrieb am Mittwoch, 26. Juli 2023 um 15:48:44 UTC+2:
>=20
>=20
>=20
>     On 26/07/2023 14:41, Jan-Marc Stranz wrote:
>      > Thanks for the tip to increase the memory area for the hypervisor!
>      >
>      > I have increased the memory area for the hypervisor from 6 MiB to
>     9 MiB
>      > and can now successfully start both guest cells with a size of
>     512 MiB each.
>      >
>      > I don't know if there is a hint in the documentation for the
>     hypervisor
>      > "Jailhouse" (in the GIT repository).
>      > If not, it would certainly be very helpful if this correlation
>     (guest
>      > cell size - required memory for hypervisor) is described
>     somewhere (e.g.
>      > in the file "Documentation/non-root-linux.txt").
>=20
>     Patches welcome! I'd rather recommend to print a proper error
>     message in
>     the hypervisor that gives a pointer to this issue.
>=20
>     Just a short explanation what happened: Jailhouse tries to map huge
>     pages to minimise pressure on TLB. In your case, the area isn't align=
ed
>     with huge pages, so Jailhouse must map tons of 4k-Pages to cover that
>     memory region. Mapping those pages requires memory for page tables, a=
nd
>     apparently, 6MiB weren't sufficient.
>=20
>     Thanks
>     Ralf
>=20
>      >
>      > Jan-Marc.
>      >
>      > Ralf Ramsauer schrieb am Mittwoch, 26. Juli 2023 um 13:12:02 UTC+2=
:
>      >
>      >
>      >
>      > On 26/07/2023 12:56, Jan-Marc Stranz wrote:
>      > > Of course, I checked the configuration for the root cell with
>      > "jailhouse
>      > > config check".
>      > > However, this is not changed at all while I change the
>      > configuration for
>      > > the guest cells.
>      > >
>      > > Also, everything is fine as long as I don't set the size for the
>      > guest
>      > > cell larger than 320 MiB in the guest cell configuration.
>      > > This only uses about 62% of the memory area reserved for the
>      > guest cells
>      > > in the configuration for the root cell.
>      > >
>      > > I will follow up on the tip to increase the memory area for the
>      > > hypervisor ( hypervisor_memory.size).
>      > > So far, 6 MiB is reserved for the hypervisor itself.
>      > > To what size should I increase this memory area?
>      >
>      > Just a bit more. Try 10 MiB or so.
>      >
>      > Ralf
>      >
>      > >
>      > > However, to find the cause in the driver or hypervisor, I lack t=
he
>      > > necessary knowledge about the structure and relationships.
>      > > So I have to rely on external help.
>      > >
>      > > Thanks a lot!
>      > > Jan-Marc.
>      > >
>      > > --
>      > > You received this message because you are subscribed to the Goog=
le
>      > > Groups "Jailhouse" group.
>      > > To unsubscribe from this group and stop receiving emails from it=
,
>      > send
>      > > an email to jailhouse-de...@googlegroups.com
>      > > <mailto:jailhouse-de...@googlegroups.com>.
>      > > To view this discussion on the web visit
>      > >
>      >
>     https://groups.google.com/d/msgid/jailhouse-dev/43f41f9d-0930-416b-a6=
18-1955e237cc87n%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/43f41f9d-0930-416b-a618-1955e237cc87n%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/43f41f9d-0930-416b-a618-1955e237c=
c87n%40googlegroups.com <https://groups.google.com/d/msgid/jailhouse-dev/43=
f41f9d-0930-416b-a618-1955e237cc87n%40googlegroups.com>> <https://groups.go=
ogle.com/d/msgid/jailhouse-dev/43f41f9d-0930-416b-a618-1955e237cc87n%40goog=
legroups.com?utm_medium=3Demail&utm_source=3Dfooter <https://groups.google.=
com/d/msgid/jailhouse-dev/43f41f9d-0930-416b-a618-1955e237cc87n%40googlegro=
ups.com?utm_medium=3Demail&utm_source=3Dfooter> <https://groups.google.com/=
d/msgid/jailhouse-dev/43f41f9d-0930-416b-a618-1955e237cc87n%40googlegroups.=
com?utm_medium=3Demail&utm_source=3Dfooter <https://groups.google.com/d/msg=
id/jailhouse-dev/43f41f9d-0930-416b-a618-1955e237cc87n%40googlegroups.com?u=
tm_medium=3Demail&utm_source=3Dfooter>>>.
>      >
>      > --
>      > You received this message because you are subscribed to the Google
>      > Groups "Jailhouse" group.
>      > To unsubscribe from this group and stop receiving emails from it,
>     send
>      > an email to jailhouse-de...@googlegroups.com
>      > <mailto:jailhouse-de...@googlegroups.com>.
>      > To view this discussion on the web visit
>      >
>     https://groups.google.com/d/msgid/jailhouse-dev/57a4477a-2c32-49ef-8c=
cc-e95e1d9fb815n%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/57a4477a-2c32-49ef-8ccc-e95e1d9fb815n%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/57a4477a-2c32-49ef-8ccc-e95e1d9fb=
815n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter <https://gro=
ups.google.com/d/msgid/jailhouse-dev/57a4477a-2c32-49ef-8ccc-e95e1d9fb815n%=
40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>.
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/10922b18-30e5-414e-8d85-7=
e1f33f2f9fan%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/10922b18-30e5-414e-8d85-7e1f33f2f9fan%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/8e9df4fc-0fb3-5149-aba6-d7f506e902af%40oth-regensburg.de.
