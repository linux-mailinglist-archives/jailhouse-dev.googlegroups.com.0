Return-Path: <jailhouse-dev+bncBCR7PPMN34DRBNN7SDVQKGQE22QEDOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23e.google.com (mail-oi1-x23e.google.com [IPv6:2607:f8b0:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9279D56E
	for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Aug 2019 20:06:46 +0200 (CEST)
Received: by mail-oi1-x23e.google.com with SMTP id f21sf4303752oig.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Aug 2019 11:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MdHUHSkxXBnRyCleXtQnIEif32NLUkrTPWPJrXCiQ6g=;
        b=SplEzvTrwqTovqz3hT++HEx0IgIhhK5uB5H/cAjWxYE7a1gFag3kij1vr+riIXiPK1
         K/R869t0cWw+R4Aqvv0uI7fPRGzIZS335SZ3LUbKj9wvzaYUeGGPiu8+TmYPNBn3mVC+
         tIpatwNy7uZMrlvC8tIIhHhjzoDFEDjrH4mLyH/sa0YLZi9EQFMw8Ud93YKuoIH2tsw0
         qUlKcor/iTbPTP9BUhKavj9s5m+sYixSEPJxZToPcTPLBgiIdJtdXAvO7hjga7bvBhcx
         Bu7xqwHRB9b4H95MP2rG/AJo8FPs7rQ6c5gqPl/YQEIGeurmQuhrGDT5rvykhDLZFVCD
         eRtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MdHUHSkxXBnRyCleXtQnIEif32NLUkrTPWPJrXCiQ6g=;
        b=ZcaNqouCWg04QhXj723vDc9EQhTsUhB6wJNfbqw9J7n04Ha+dlKQhyfRSr7W/Y2ZXL
         5vKyqLffp3LbnsYjl+vYcV5q+dPUTSDf2co9S70RYWOlZzFS+BJxaIGLuccB9nrTL00r
         kfCZgrokydNg0YkW+a6juXeDd4eYG42klr5AiMoaLAglmL+9ZKwN1ILnHpySe02VgWmt
         K6BoLLE2bpVY+a8hfkNHABKteVoZ3ae6CWE3vr3W1MPulq+aJLz74w18WatlbH5ZLaqn
         b/7fVDv5TKbozMYGSnOc9EmjIHD6bes9QgKJJGYCqAtlOHkMYqgl0pagcJPbs7RnwgR0
         5vTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=MdHUHSkxXBnRyCleXtQnIEif32NLUkrTPWPJrXCiQ6g=;
        b=oqnWXK/811+j0jn1JC9uyR6yt9Ai9cAk76vpubdr9o3qE0V/skmLarIHYKDeJ6QCBo
         PPh2yrJifURijV2gNSRP3CkhXct1lvdx+wddjtnTf3jBcqKxB9EXINOyDxpDqJR5Kuld
         tDLuhKlZfORRA0s8ZoR4FURE0g4qtRmkGAqSCIQG1fH+IGDuuM1L6wH8z1maNuqiLAQU
         4s3+gGSy/WtNvq8FrtRwp3o7O5OzPLbOBUjUX+UNAenoTpDND42zoOJC5OxaxWY3wx6N
         uRPd7G+5wxyWeGREp8++DD/X6hPO5YhfcDY7qDutCSrVOm/y0AOG2uGInrBYbvI295wK
         I0tQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXPSj89il3gS008v2HzK1IYr/sGgRmBN88pkceZBV6/QX3Bfj8s
	w58NU1ng0ArWCbdXmvfUhHA=
X-Google-Smtp-Source: APXvYqys5gn82Dr53SgTlUJYbEmISypTcM6yATXaeSZCiLk2rZ3HJyMtxgSN7TikobLkQAkoW+F7Rw==
X-Received: by 2002:a9d:6aca:: with SMTP id m10mr17603119otq.48.1566842805753;
        Mon, 26 Aug 2019 11:06:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:6250:: with SMTP id i16ls492192otk.1.gmail; Mon, 26 Aug
 2019 11:06:45 -0700 (PDT)
X-Received: by 2002:a9d:5c0f:: with SMTP id o15mr9344241otk.81.1566842805280;
        Mon, 26 Aug 2019 11:06:45 -0700 (PDT)
Date: Mon, 26 Aug 2019 11:06:44 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <0fdd23fc-3b30-4b8d-8b7c-eabf821c625a@googlegroups.com>
In-Reply-To: <1c8ad7db-eb23-034d-dbad-33267d4227f1@siemens.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <12a82b12-b9bd-4258-87fb-9525f4bb648a@googlegroups.com>
 <5fe86ed7-e82f-3fef-6eef-a888e4ef6be7@siemens.com>
 <1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c@googlegroups.com>
 <164159e0-478e-c5e9-fc8a-e0c0cb27da7a@siemens.com>
 <f1de42fc-bae2-4962-ace6-a38e99a441d4@googlegroups.com>
 <dd33650a-c068-52ca-4da7-4537de652bfa@siemens.com>
 <82a56f53-a498-4a27-8458-250d9a7e7078@googlegroups.com>
 <211c06d2-9f92-cbd1-8215-12c577eefa62@siemens.com>
 <2add490d-0d13-44f6-9873-d7fcbf1c4141@googlegroups.com>
 <2dc2470b-9494-4f43-a582-06c2558fa985@googlegroups.com>
 <df7be3b4-a447-0ff1-f43b-ee37bf6513bb@web.de>
 <c183c116-5942-4d08-a0a7-a897e8fbed20@googlegroups.com>
 <6dfd2128-011a-420f-860f-4ccb472c079f@googlegroups.com>
 <67cdfa4b-86e9-496a-3878-b5a0016b75c0@siemens.com>
 <521c355a-eacc-434e-b50d-dd7c797be08a@googlegroups.com>
 <4fe67562-ffb1-a306-542e-c27b0450bca1@web.de>
 <71ab42b5-b8c9-4392-9575-759f6eb899a0@googlegroups.com>
 <1c8ad7db-eb23-034d-dbad-33267d4227f1@siemens.com>
Subject: Re: Colored Linux as inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1630_135016101.1566842804405"
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

------=_Part_1630_135016101.1566842804405
Content-Type: multipart/alternative; 
	boundary="----=_Part_1631_539613519.1566842804406"

------=_Part_1631_539613519.1566842804406
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am using inmate-zynqmp.dtb for non-root cell, which is not being used by=
=20
root cell. Or are you referring to Petalinux's device tree?

segunda-feira, 26 de Agosto de 2019 =C3=A0s 18:03:56 UTC+1, Jan Kiszka escr=
eveu:
>
> On 26.08.19 18:39, Jo=C3=A3o Reis wrote:=20
> > Thank you, that worked!=20
> > But when i connect to non-root cell using ssh, i issue commands like=20
> "cat=20
> > /proc/iomem", and it still displays the contents if i was still in root=
=20
> cell. Is=20
> > it normal?=20
>
> Are you using the same device tree for the non-root cell? Then no=20
> surprise.=20
>
> Jan=20
>
> --=20
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE=20
> Corporate Competence Center Embedded Linux=20
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0fdd23fc-3b30-4b8d-8b7c-eabf821c625a%40googlegroups.com.

------=_Part_1631_539613519.1566842804406
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am using inmate-zynqmp.dtb for non-root cell, which is n=
ot being used by root cell. Or are you referring to Petalinux&#39;s device =
tree?<br><br>segunda-feira, 26 de Agosto de 2019 =C3=A0s 18:03:56 UTC+1, Ja=
n Kiszka escreveu:<blockquote class=3D"gmail_quote" style=3D"margin: 0;marg=
in-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">On 26.08.19 =
18:39, Jo=C3=A3o Reis wrote:
<br>&gt; Thank you, that worked!
<br>&gt; But when i connect to non-root cell using ssh, i issue commands li=
ke &quot;cat=20
<br>&gt; /proc/iomem&quot;, and it still displays the contents if i was sti=
ll in root cell. Is=20
<br>&gt; it normal?
<br>
<br>Are you using the same device tree for the non-root cell? Then no surpr=
ise.
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, Corporate Technology, CT RDA IOT SES-DE
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/0fdd23fc-3b30-4b8d-8b7c-eabf821c625a%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/0fdd23fc-3b30-4b8d-8b7c-eabf821c625a%40googlegroups.com<=
/a>.<br />

------=_Part_1631_539613519.1566842804406--

------=_Part_1630_135016101.1566842804405--
