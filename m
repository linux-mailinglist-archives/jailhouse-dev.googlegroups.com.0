Return-Path: <jailhouse-dev+bncBDS77PFL3YERBHOF26CQMGQE6T4DQEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd3c.google.com (mail-io1-xd3c.google.com [IPv6:2607:f8b0:4864:20::d3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCCF396DF5
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Jun 2021 09:32:47 +0200 (CEST)
Received: by mail-io1-xd3c.google.com with SMTP id w17-20020a6b4a110000b0290492680338ecsf6413156iob.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 01 Jun 2021 00:32:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1622532766; cv=pass;
        d=google.com; s=arc-20160816;
        b=i6pgC1zUigK31fHPUyGOgwmNE+ysQ2PZNouZL1zGa/LJCHQCjk62nyaySqd1wzvsZI
         WJ9GlvZ//boMbq9tyvymphmlDBCNpxgIQ6CzQSYUHGb2rAbds2PdAr6rke2daNs73dvn
         bzODHMkKiqNLRHKcyc+xA1IPgIQHEFUnwpUUVz8eiuxy+OkfX+GFwiXnFQOTUVo+DZ8H
         x/UdZizaSrh1S3Qs301VZuNdyaOfej5t9czzqC6tzoo8TnTN5zuGRQNHJVePV32DhGkW
         wSs2xU8SmaJFT4cqSYR6D6GhIUfIcZG9aILauOgeqFSgEpH5D+yJY0NRXd5bHW0CAtMS
         j5gg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=kgfhXPYV245m4tv5HfzYqhRl5TAtMjRYuxVMtdUL1Rw=;
        b=CccSTqEwqyW/5xSzK/XrOY/6ckKQ905qv75aAGMXEU8VH0DX38BjVaexKrlSSCCVdT
         wcWd6CG5o+HSTVPn0G2mnXkLhZzw0Vm9EovJv51eAhArKfj6pwQ70hGkFDD1Qg96fuaD
         HRBw0kWCUNXlLeupltsOgq2l4NtOPHAe3kViV/ZxAbxFYh87Q0Bz/1Mh4vh9PavLd52J
         DGlMFI1WlN9OeXRQLOFyJOI8s9GVByDHH3yW1bj4pVyRO78H9NABv4aezsIkZMvYRT6l
         BUZJXrjEays/PEoSoTb7vHXlRuqG3SXkZLHl9baSKZ2/NfvgwYnbnGaTJ2a7HP73pBE8
         beog==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@cimware-in.20150623.gappssmtp.com header.s=20150623 header.b=oyXfsf+m;
       spf=pass (google.com: domain of pkali@cimware.in designates 2607:f8b0:4864:20::1036 as permitted sender) smtp.mailfrom=pkali@cimware.in
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kgfhXPYV245m4tv5HfzYqhRl5TAtMjRYuxVMtdUL1Rw=;
        b=PKaclEStnOv5bHaI3lAtMh6tXOUmEp6LadStEZ7uZDX93OW2cX5ZU55mKn9H07gq7R
         pQMRxA+Hw4b6QJ2rR7oiYVRjTgqReztm/fsXNd8Y5b7imWmnQNfcUBkaVbf+TcdONXgb
         bYbBRlsKWp2YvL8uxF6PRodGyoU/rSrrrMXfPyThDlMvQ8Z2lwrOO/uJiY/HUcrOBe7S
         5WrOa7751tOiPf518YIq48woWYvjc2rCzXjfSHCfBkiZTkz7CoWA4jg276fevcBe+wFP
         /yoSPk1Tzk8WpvBb4+n9uze4Vr10fBurpsloryCR6P1uGoiNs0BogcHt7aMVbBJjTiaP
         vFVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=kgfhXPYV245m4tv5HfzYqhRl5TAtMjRYuxVMtdUL1Rw=;
        b=FuY0izctlHAbMDjWODhhDbQUbHmVpDhwtPE8AY6Xs3RxiacvJvYC3SHo0o+zW+fosu
         A14N9mYMq5mkxzvdjqdIe/va+zSc6kNxeBzDEbBUuzoMXXDK5JaGWlVnzySMNu+O14y+
         khppG/VacErgVerSha499JMr1xSIoJk3P9hs4uoTOC2G/GfLRieIk04XDIdMXsWfO0hH
         NnzYbymIWQiv9vVHlpF/M0Jm+/LJNNXId2bVXLCk+o4Fcfdu5tLnA60qKa9CFScLOvww
         CP2ky+UB8NTWs96J9KB0BpglikHvbEXk95kktNpFH+BoVGKQSugEVJrSKdckJA00nzha
         cTng==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530RsHrmlzIEnq2LyW2SqHdGCUYo78+PSDhP65ok2X8lmjv3YhSq
	BPoaud0+Ail9h9Osx/wDwco=
X-Google-Smtp-Source: ABdhPJzK+rEP/utNhOdJZPmjBkN4sG2tWmZqRw5fEKOxim0+EhVsgujoO0wboPAlMn7gfOWUHrJGPg==
X-Received: by 2002:a05:6e02:1085:: with SMTP id r5mr14059732ilj.276.1622532765961;
        Tue, 01 Jun 2021 00:32:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a02:cc7b:: with SMTP id j27ls2193975jaq.10.gmail; Tue, 01
 Jun 2021 00:32:45 -0700 (PDT)
X-Received: by 2002:a02:c04c:: with SMTP id u12mr24032587jam.129.1622532765253;
        Tue, 01 Jun 2021 00:32:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622532765; cv=none;
        d=google.com; s=arc-20160816;
        b=EA4zpS1csw+fllerERiuGFLL8leKII3SHQuBPqJBbv3oi7LBfS05AbNhPbSvu2K/1D
         upSjkG1ASK4OF+cs0q23IBhASsygicaH9mv7XustfjyAk/cxGlEsN1/OVkLqxbvuWNva
         hUIv3/7p+Ef1D8eCvXi/YK717iMcsOQmGRRtqnIm9WAA6Fn1NiSg1k0nt3WxFf4Uanq6
         T5Sxiky1uvDgEY81f5Tys0ESa3WtRrolNhIcQbYkh8vQmZlcfSOgLtRq39KL2PhTjnlF
         9Nc6NHJyGeXCQt4W/VCRiLwK49M+DScTKUhORBV8/MTmzmxzDc34kdYwpFHZHiIHq0/t
         qpkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ymsBE3wfXFw8NoxLGNLTpa3z/O3dCX2Y8terGdFvaSI=;
        b=btxRmFp3qW39g0r5r8wWij7mZSI8I+8QKEZSuj8/JEx4U6gGZJeF8MiYLvsshuM5pm
         xjoSwRFjBxvUlpBUbUTTK8a4lS24mOU+cNKktzlKrp7HSfMheJyOZaKVAfZPr/wD62PL
         6uQycoIZ7BUV2NmQz99ZHVluMCzqYd6yHDtm+sqpd/Qs9tjyXL0R7uDjcaLDMd2JnYds
         jRYu5DIWG6g6ygnuvhifviMpRiViAXQjq5M0uAMGUD9oS9Iwlx7vC+Q3iT5xTubbwfzN
         9N1eglNftK9er4JpNOpGqiFJhZ06epuk7ey0rbEKCPwrHosZr7JQPM6DrrA9OGuaFKQm
         mFSQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@cimware-in.20150623.gappssmtp.com header.s=20150623 header.b=oyXfsf+m;
       spf=pass (google.com: domain of pkali@cimware.in designates 2607:f8b0:4864:20::1036 as permitted sender) smtp.mailfrom=pkali@cimware.in
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com. [2607:f8b0:4864:20::1036])
        by gmr-mx.google.com with ESMTPS id f13si1506743iog.3.2021.06.01.00.32.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jun 2021 00:32:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of pkali@cimware.in designates 2607:f8b0:4864:20::1036 as permitted sender) client-ip=2607:f8b0:4864:20::1036;
Received: by mail-pj1-x1036.google.com with SMTP id k5so7867321pjj.1
        for <jailhouse-dev@googlegroups.com>; Tue, 01 Jun 2021 00:32:44 -0700 (PDT)
X-Received: by 2002:a17:90a:ae11:: with SMTP id t17mr3509573pjq.85.1622532763845;
        Tue, 01 Jun 2021 00:32:43 -0700 (PDT)
Received: from Administrators-MacBook-Pro.local ([27.7.95.25])
        by smtp.gmail.com with ESMTPSA id y1sm12707072pfn.13.2021.06.01.00.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jun 2021 00:32:43 -0700 (PDT)
Subject: Re: Writing configuration files
To: Jan Kiszka <jan.kiszka@siemens.com>, jailhouse-dev@googlegroups.com
References: <989156a0-b5d6-7672-a109-9860c5f94867@cimware.in>
 <ce3b4401-63c8-bd97-64f0-8a14682f70ec@siemens.com>
From: Prashant Kalikotay <pkali@cimware.in>
Message-ID: <914726a1-7178-321f-42fb-012ec241266a@cimware.in>
Date: Tue, 1 Jun 2021 13:02:41 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <ce3b4401-63c8-bd97-64f0-8a14682f70ec@siemens.com>
Content-Type: multipart/alternative;
 boundary="------------C8C3F7AB6A1AA1659BA78974"
Content-Language: en-US
X-Original-Sender: pkali@cimware.in
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@cimware-in.20150623.gappssmtp.com header.s=20150623
 header.b=oyXfsf+m;       spf=pass (google.com: domain of pkali@cimware.in
 designates 2607:f8b0:4864:20::1036 as permitted sender) smtp.mailfrom=pkali@cimware.in
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

This is a multi-part message in MIME format.
--------------C8C3F7AB6A1AA1659BA78974
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable


On 31/05/21 10:16 PM, Jan Kiszka wrote:
> On 28.05.21 14:10, Prashant Kalikotay wrote:
>> Dear all,
>>
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I am=
 trying to write configuration files for the root and
>> the non-root cells for an arm64 based system. I have checked the video
>> https://youtu.be/7fiJbwmhnRw and also the pdf. I could just infer from
>> these that I have to write the config files using the already existing
>> ones eg: amd-seatle.c and other files. But what I am not able to
>> understand is how do I come up with the different values in the config
>> files as in other files.
>>
>> For Example:
>>
>> This is small portion of amd-seattle.c how do we come up with the values
>> in the mem_regions[] as 20, irqchips[] as 3, hypervisor_memory.
> These a C-structures - the array sizes derive from the number of
> elements we fill in below.
>
>> phys_start =3D 0x83e0000000, and all othe r values in the config files.
>> Which document has been used. Any pointer to any of the documents of the
>> various config files listed in the configs would be a lot helpful.
>>
> Concepts should have been explained in the tutorial you cited, details
> are unfortunately not specified. Therefore, you need to study existing
> configs and translate that knowledge to your specific target.
>
> If you understand that partitioning concepts and mechanisms in
> Jailhouse, doing so should be possible (you can always ask for concrete
> details here). If not, even a detailed specification of the config
> format would likely not help because you always have to apply that to
> your concrete case, and the abstraction level of Jailhouse is fairly low.
>
> Jan
>
Thanks for your reply Jan,

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 I am trying to write=20
configuration file for a arm64 based system. My doubt is how to go about=20
allocating memory regions for the root and non-root cells. How do I come=20
up with these addresses

phys_start =3D_/0x83e0000000 /_.

Regards,
Prashant K

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/914726a1-7178-321f-42fb-012ec241266a%40cimware.in.

--------------C8C3F7AB6A1AA1659BA78974
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 31/05/21 10:16 PM, Jan Kiszka wrote:<=
br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:ce3b4401-63c8-bd97-64f0-8a14682f70ec@siemens.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On 28.05.21 14:10, Prashant Ka=
likotay wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Dear all,

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I am try=
ing to write configuration files for the root and
the non-root cells for an arm64 based system. I have checked the video
<a class=3D"moz-txt-link-freetext" href=3D"https://youtu.be/7fiJbwmhnRw">ht=
tps://youtu.be/7fiJbwmhnRw</a> and also the pdf. I could just infer from
these that I have to write the config files using the already existing
ones eg: amd-seatle.c and other files. But what I am not able to
understand is how do I come up with the different values in the config
files as in other files.

For Example:

This is small portion of amd-seattle.c how do we come up with the values
in the mem_regions[] as 20, irqchips[] as 3, hypervisor_memory.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
These a C-structures - the array sizes derive from the number of
elements we fill in below.

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">phys_start =3D 0x83e0000000,=
 and all othe r values in the config files.
Which document has been used. Any pointer to any of the documents of the
various config files listed in the configs would be a lot helpful.

</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Concepts should have been explained in the tutorial you cited, details
are unfortunately not specified. Therefore, you need to study existing
configs and translate that knowledge to your specific target.

If you understand that partitioning concepts and mechanisms in
Jailhouse, doing so should be possible (you can always ask for concrete
details here). If not, even a detailed specification of the config
format would likely not help because you always have to apply that to
your concrete case, and the abstraction level of Jailhouse is fairly low.

Jan

</pre>
    </blockquote>
    <p>Thanks for your reply Jan,</p>
    <p>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 I am trying to write
      configuration file for a arm64 based system. My doubt is how to go
      about allocating memory regions for the root and non-root cells.
      How do I come up with these addresses <br>
    </p>
    <pre class=3D"moz-quote-pre" wrap=3D"">phys_start =3D <u><i>0x83e000000=
0 </i></u>.=20

Regards,=20
Prashant K
</pre>
  </body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/914726a1-7178-321f-42fb-012ec241266a%40cimware.in?=
utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/j=
ailhouse-dev/914726a1-7178-321f-42fb-012ec241266a%40cimware.in</a>.<br />

--------------C8C3F7AB6A1AA1659BA78974--
