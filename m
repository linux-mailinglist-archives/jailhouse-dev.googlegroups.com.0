Return-Path: <jailhouse-dev+bncBC2PLTFIYAJBBL5I3D5AKGQEWF3D3WI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x13b.google.com (mail-il1-x13b.google.com [IPv6:2607:f8b0:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E2225F902
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Sep 2020 13:06:25 +0200 (CEST)
Received: by mail-il1-x13b.google.com with SMTP id z14sf2336649ils.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Sep 2020 04:06:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599476784; cv=pass;
        d=google.com; s=arc-20160816;
        b=y7WbygKjTRfUexK9eipcVT2Glsy8QT5TT5EMV9MwBEQ+4vQUXj1ddNArp/v6aPPTMA
         kcjmzuOioJg+8Jc3zyiWaKfDrrmUkSbeGdDil+q75AP8f8EF2dOURZZHDYd6oy04yMGY
         v0iV4NvaKU4JXm/4IvbrsrN+dXPjnVG6g3OKrb0faCIJh6t7re9DNHSoIPaV7OPBcwQB
         uSdT2UY37HDkm+1KUYax/galqIonq2bbTZLayl5uBY5EDPk/EjVW/U92MCrEG4qk/pRw
         6ix/D7GNeCDxP4mv1/2T46m3Xakyn2jU5bAIw+om/Uy6Y5iK6toO0qM35J2tQgJLM/nM
         VSWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature;
        bh=PRGs9O41Zx94YIWDh0CNiq1U9rshhxXNm6XVA+kbm2o=;
        b=dtJhGihqSWDKUT7HJpWVF2UyiOgWBIcdymMnOBaUnMLQfNp+LkIhV49flhztqrLSqy
         fipDwtk6o4kurP7ueQ0G9yKRnZJzYYufj3WSTJOLYUNKnQnIv9g4QDnbJb5LknBxbavq
         Rx+82U3Ys0GI46l0NgkvY4hIJjZ/Y//isdrwqOo2VfrWPFP/LPjId54/iS6R18FZ9v7Z
         G4iuHPsss66t1d85uFF1pHehmyC5WFKxirohjIqg3Ll0kFJJwJEQ+3rhxCtpMA5g3AlL
         2RLlhUcnhuD7Pouocqv/muSctoFpCR8DV7aiCsfC2kPLUQYHJhHOnipjh9xGmbxIXKUv
         0rbA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gDqwZAgx;
       spf=pass (google.com: domain of jsmoeller@linuxfoundation.org designates 2607:f8b0:4864:20::e2c as permitted sender) smtp.mailfrom=jsmoeller@linuxfoundation.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linuxfoundation.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PRGs9O41Zx94YIWDh0CNiq1U9rshhxXNm6XVA+kbm2o=;
        b=i12p9hOQvVvDHLLadKZbELEyT8Gh+BDdSdfrZ5B6CQlAZHzzW1WMEZzempb6yQ991w
         hlZl1kua5eJvEYqGlqDe3aVxUK7Yb4AIBvKP2yrWEYO57CuJ0iuKEUX+Z4UhEj419QZ5
         OIyaIdlDjH3jvpHEZk9LZylOOILoJO+q+Xs8V/4dtP2wO0gVHmmIiIEHhN7Yi7hxU1BU
         xBpzBkFHR5FCONqG9Y8YhLskUNSpfSaNaPps02Pi2OlaJDAyPo8fvHuSpg9Maslrtm7y
         R4M+CvrovOSS94QQQzLh2AwzPRozcnqi0X7jD1pDZpdqRKbUMPnBdMmji57Rp+F/u1KL
         8k2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PRGs9O41Zx94YIWDh0CNiq1U9rshhxXNm6XVA+kbm2o=;
        b=VpsYdVKxYqHZpaUzNWiRUyLbN9WkinuK4ZDq+1E03AwXcFbiLMTo94uWYIVVcI6NxW
         xZ0W5mqYrcinSg7TJce7WsSC8+vnpHZ0xf2kOnwu93jXzYYDxd3GTyTDudEvCLoeZvZ0
         iRmRJrytb0WQyQeSc17iA72xr9vzzMrvXjudV01tUsLbrIxCSDlNQkrkw+j33rSd1F84
         dAyJZeKik1V7D9JqM9BffgbOzzaRN4t7u3IkFv9P7sLn4uT35WqTnmrXPglnM4HtYT3t
         EoK9pHSn/1ex8PCmvjgvH/hjC6RIDVHdwRXWvxXQGDXpsntU3DY56fGkoe8wJ7n8PL7y
         mPqg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532SFfpQSU9ehddJdhUpxCv6Ugrl2Bz88Gnx5+RpnoZ0901o5p+d
	9oeZm7gtl3uEMPSPU5Rkus0=
X-Google-Smtp-Source: ABdhPJy4Bhddt3WnRIZA/W5+Qye+rjtp/wEr+t22256lAum8cHHE+syFq0BBLxLsQyPpl/GIjl804g==
X-Received: by 2002:a92:a113:: with SMTP id v19mr18501173ili.173.1599476783936;
        Mon, 07 Sep 2020 04:06:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6602:2c03:: with SMTP id w3ls2589982iov.9.gmail; Mon, 07
 Sep 2020 04:06:23 -0700 (PDT)
X-Received: by 2002:a05:6602:2245:: with SMTP id o5mr2754558ioo.105.1599476783384;
        Mon, 07 Sep 2020 04:06:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599476783; cv=none;
        d=google.com; s=arc-20160816;
        b=lS0RfLOj3OxR8m+JE9/AVr1axfOyLs4wqQMZ245QPfGBdk9+8HKuU/TrjKhFK2Wyl/
         Fh+amyIRbNvOelPuwxZln8VjLTb/pIRvaorv9ZGuMbzRRsmoZbmNCz4cc2GWJVrTV9GR
         9w2SsROL77fFKoKx+iMf1iGbI1uBer/4AVju/YhjcXKQUoXr7xsbcA2G+/N93HPfLt7d
         JpSZm41FM+9HxaO00Gop7P+SC3r3EIcE2sID7X6xAo5IWKSxeHZWE0iEK/qFF27+vhu5
         9L9sCJvJ11C4T2t1bFz0VLZplOHQ3x01QPfvFDoZB0dWSPQEmJw1Gvq0gQOrbruDWLdQ
         BsPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=A27gjLjNHA330XczheQtccUTcTL0CXoWSrhBdtPOFzs=;
        b=XZbVxHFrY0dpRjYNECAqBcO/9ekbkDoY6cCVrP05JUwQlPufl4bYrvbM+YblQ05gIs
         iC4PaNcQAwS9/PwsmpLkNFsPKXMkSK9XTi8oby6E1w93nPYpEJLExYE111WC8iqvA1qf
         sK7/RYJeazhp6aYv4zzLeyKDfqfQlm8gQernbgnSEkXr40kVqLkl7DYQjgQQTt2Pn/XB
         A7Ld+l/teCf+uTAlfG5pTTDaHdw4qgXoRFhXiqxOu3dtx4ZWVPsV1eXTgYKhYcean1Iv
         6q9dEzipB+PvYGqUFyHJXSU1JUlGvnmFYVwWcPERwdIvmSZXQ58ViVRDYrQOA2XAGKgF
         0I3g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gDqwZAgx;
       spf=pass (google.com: domain of jsmoeller@linuxfoundation.org designates 2607:f8b0:4864:20::e2c as permitted sender) smtp.mailfrom=jsmoeller@linuxfoundation.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linuxfoundation.org
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com. [2607:f8b0:4864:20::e2c])
        by gmr-mx.google.com with ESMTPS id m2si957393ill.5.2020.09.07.04.06.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2020 04:06:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsmoeller@linuxfoundation.org designates 2607:f8b0:4864:20::e2c as permitted sender) client-ip=2607:f8b0:4864:20::e2c;
Received: by mail-vs1-xe2c.google.com with SMTP id c127so1448544vsc.1
        for <jailhouse-dev@googlegroups.com>; Mon, 07 Sep 2020 04:06:23 -0700 (PDT)
X-Received: by 2002:a67:edca:: with SMTP id e10mr12255183vsp.102.1599476783066;
 Mon, 07 Sep 2020 04:06:23 -0700 (PDT)
MIME-Version: 1.0
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <0153a372-c0c8-48d7-a595-aa502f81b09bn@googlegroups.com> <f7aa0d56-f1a8-ff95-c565-d1f7edc707a3@siemens.com>
 <7ce9ec5d-5e58-4b39-ac21-2f6a1d391ce4n@googlegroups.com> <6aaac5b2-1c88-699a-6568-0642e4a1a4a7@siemens.com>
 <2533b2ec-3ff2-4c01-8899-d1ada8d578e9n@googlegroups.com> <dd5c252f-516e-3758-917f-a0cd5ca0f4c4@siemens.com>
 <CAOOGbpg5t1ykh1OaS_rKXMzfL2u9F+igLuoA3wSg4boAhxtuWQ@mail.gmail.com>
 <9ff0b838-a854-3ef0-6487-dbda6d488184@siemens.com> <CAOOGbpgwq0=B85FFAaPCGC+W3UsFYtp6ROAsCbUdD2=g_Ak1kw@mail.gmail.com>
 <b501a3d0-70cd-2126-8fa0-fff217caa20c@siemens.com> <6765e219-706a-4124-9ac2-d40109d69f7cn@googlegroups.com>
 <2924a8c6-5b7f-427a-846e-9fc0e64bad53n@googlegroups.com> <6ab98ec9-0255-830c-589d-781da3bd2838@siemens.com>
 <cc674085-e9fe-4bd9-a591-47593459c6f2n@googlegroups.com> <138c5784-6dbd-add0-2364-9fef4b7a9ea6@siemens.com>
 <de0ebbce-9513-4820-8975-781f816f9841n@googlegroups.com> <0e52381f-15b2-e833-7717-6335ddcc5f35@siemens.com>
In-Reply-To: <0e52381f-15b2-e833-7717-6335ddcc5f35@siemens.com>
From: Jan-Simon Moeller <jsmoeller@linuxfoundation.org>
Date: Mon, 7 Sep 2020 13:06:11 +0200
Message-ID: <CADja47McPVRWvi8u_fP8z7ZqPGcdW324AKG2e0iK_osTCd=Qkw@mail.gmail.com>
Subject: Re: Build jailhouse on embedded target
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jan-Marc Stranz <stranzjanmarc@gmail.com>, Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="0000000000007b48ee05aeb7352b"
X-Original-Sender: jsmoeller@linuxfoundation.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@linuxfoundation.org header.s=google header.b=gDqwZAgx;
       spf=pass (google.com: domain of jsmoeller@linuxfoundation.org
 designates 2607:f8b0:4864:20::e2c as permitted sender) smtp.mailfrom=jsmoeller@linuxfoundation.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linuxfoundation.org
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

--0000000000007b48ee05aeb7352b
Content-Type: text/plain; charset="UTF-8"

Hi!

We tested the layer with dunfell and master.
Warrior and zeus are too old.

Best,
JS

Jan Kiszka <jan.kiszka@siemens.com> schrieb am Mo., 7. Sep. 2020, 13:02:

> On 07.09.20 12:51, Jan-Marc Stranz wrote:
> > Running
> >
> > # python
> >>>> from mako.template import Template
> >
> > I get a lot of traceback messages.
> > The last message is "ModuleNotFoundError: not module named 'json'".
> > This message comes from
> > "/usr/lib/python3.7/site-packages/mako/compat.py" (line 140: "import
> > json  # noqa").
> >
>
> The python-mako package is likely missing a dependency, or it was not
> properly converted to python3. Yocto bug.
>
> Note also that warrior is a bit old. Maybe you do not have the latest
> 2.7.4, or maybe this was never fixed in that series.
>
> Jan
>
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux
>
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/0e52381f-15b2-e833-7717-6335ddcc5f35%40siemens.com
> .
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CADja47McPVRWvi8u_fP8z7ZqPGcdW324AKG2e0iK_osTCd%3DQkw%40mail.gmail.com.

--0000000000007b48ee05aeb7352b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi!<div dir=3D"auto"><br></div><div dir=3D"auto">We teste=
d the layer with dunfell and master.=C2=A0</div><div dir=3D"auto">Warrior a=
nd zeus are too old.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Bes=
t,</div><div dir=3D"auto">JS</div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">Jan Kiszka &lt;<a href=3D"mailto:jan.kisz=
ka@siemens.com">jan.kiszka@siemens.com</a>&gt; schrieb am Mo., 7. Sep. 2020=
, 13:02:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">On 07.09.20 12:51, Jan-Mar=
c Stranz wrote:<br>
&gt; Running<br>
&gt; <br>
&gt; # python<br>
&gt;&gt;&gt;&gt; from mako.template import Template<br>
&gt; <br>
&gt; I get a lot of traceback messages.<br>
&gt; The last message is &quot;ModuleNotFoundError: not module named &#39;j=
son&#39;&quot;.<br>
&gt; This message comes from<br>
&gt; &quot;/usr/lib/python3.7/site-packages/mako/compat.py&quot; (line 140:=
 &quot;import<br>
&gt; json=C2=A0 # noqa&quot;).<br>
&gt; <br>
<br>
The python-mako package is likely missing a dependency, or it was not<br>
properly converted to python3. Yocto bug.<br>
<br>
Note also that warrior is a bit old. Maybe you do not have the latest<br>
2.7.4, or maybe this was never fixed in that series.<br>
<br>
Jan<br>
<br>
-- <br>
Siemens AG, Corporate Technology, CT RDA IOT SES-DE<br>
Corporate Competence Center Embedded Linux<br>
<br>
-- <br>
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com" tar=
get=3D"_blank" rel=3D"noreferrer">jailhouse-dev+unsubscribe@googlegroups.co=
m</a>.<br>
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/0e52381f-15b2-e833-7717-6335ddcc5f35%40siemens.com=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://groups.google.com=
/d/msgid/jailhouse-dev/0e52381f-15b2-e833-7717-6335ddcc5f35%40siemens.com</=
a>.<br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CADja47McPVRWvi8u_fP8z7ZqPGcdW324AKG2e0iK_osTCd%3D=
Qkw%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CADja47McPVRWvi8u_fP8z7ZqPGcdW324AKG2e0iK=
_osTCd%3DQkw%40mail.gmail.com</a>.<br />

--0000000000007b48ee05aeb7352b--
