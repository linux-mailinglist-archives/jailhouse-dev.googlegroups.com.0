Return-Path: <jailhouse-dev+bncBCDKHIWT5EIBBK5QWSOQMGQEPYXWTGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3b.google.com (mail-yb1-xb3b.google.com [IPv6:2607:f8b0:4864:20::b3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 4540165896C
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Dec 2022 05:31:41 +0100 (CET)
Received: by mail-yb1-xb3b.google.com with SMTP id h66-20020a252145000000b0071a7340eea9sf18527531ybh.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Dec 2022 20:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vSRETqWcyqCGPmeTKuDojgEXAnnqIYAkW9z6e8ZcENA=;
        b=OY6RswFEtLGY4gVwx5FP2FfvWtZU/dVAoc9Qmr3NUPA4d7hq/FXhvWYkuIqYEwlYYI
         evN8MlhrfMuZYCgj9LFD3Hs4kklYLF3XbJOaamkdt2y2qaUnrUHqVHfcHVkBR0Ni/rhq
         bySA+SfsOWtzyvMY6XWpv3AmpIRa6+wGOyTQn1ajK9sNMvRq/qkz1CrpGK6ufROW+5Ru
         NvshUGajLpY4FGjBLF1CU4P0whNylDmZVZkxzLuqvD+w1MF43hBsa0VCT35g5xLL57p3
         H7+EyHBNDgVlvb2Uye8twNTYZTs3oNxh5HwZ0vY31iTnAu4G3kiPLU4D8CBpgIIjzwo0
         Rb1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vSRETqWcyqCGPmeTKuDojgEXAnnqIYAkW9z6e8ZcENA=;
        b=CvYa00WkE8ZS1zVVK0aaooqnAWYSd/k5X2JD6QAc6fQDtRuIXPb7z8i9cH8wqFtkIT
         YMJh9GDKCsVoWliYm9Oi+saKyouH+efroNJSflXWQ/4oWP3cBTLWQ9juJyR84YxdDw7q
         4G02y75WUGHqpyDVwVKGoSwiudI5Zn01JNkCcNOst9y5s1RaYOX9nFumAGBITS8C/OKa
         CXtW+3A1q/IxOV+5rgNlilvpWwlrKR6B0FQz7YyG0bX5YIXu7v2iOCTyvInA/4dFGz/W
         XkPedaYsQfTOP2DkZt/eHZ2f4/+6eqrVA91NTu/CB0TWf0HddVUc+Miv6pN0lZlZUWI0
         agAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vSRETqWcyqCGPmeTKuDojgEXAnnqIYAkW9z6e8ZcENA=;
        b=UPjztWEb7MvnLht+Jod8Y4T1M7Aas3oHr3nUzk1txUApXWZVk5pK9McG6YCrBkdUu9
         e6ohhp827SqZOuEDOIuBhJsMdaTy1EE7INH8iwT+dVBRzCvK7yz0gbodeat3taRA3ZAb
         yqxToIYaEluwqkhuqyDEUS8oV3HMFcXprwBxS74M8ApMB393RPJqH80kauyCP6CCHs4m
         UuvrmQpxOE0mwUm1rRD4Jxl4Y2Qkm09uXdQa4vpxCLN1YLwFVEHuY47tCDuuFHCQhWTj
         mP5t8BfMFtSijEWfJRwKvLTAK2p4M+2Vyo3HQL/jv9xbnITEwzYO4On/8xInP3vwM55/
         y+MQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kqqt5j5q9YdoneXc6Ws4uelVWjyXEePJoBR6olcNppctfulQGp9
	konqn8EXhqE44b37bgz5e/k=
X-Google-Smtp-Source: AMrXdXt58oRxWMAk/9GP5lpthnbr3DKJDukuAjlpkXOn7GPXG5jELDt9K0lSKMj+mCUsfwyu9DqcJA==
X-Received: by 2002:a25:ba89:0:b0:70d:a0d0:4649 with SMTP id s9-20020a25ba89000000b0070da0d04649mr3169368ybg.488.1672288299743;
        Wed, 28 Dec 2022 20:31:39 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:690c:fc9:b0:36a:2cc6:5e7e with SMTP id
 dg9-20020a05690c0fc900b0036a2cc65e7els6555812ywb.7.-pod-prod-gmail; Wed, 28
 Dec 2022 20:31:38 -0800 (PST)
X-Received: by 2002:a05:690c:444:b0:3b6:4fa2:1a10 with SMTP id bj4-20020a05690c044400b003b64fa21a10mr3257501ywb.48.1672288298674;
        Wed, 28 Dec 2022 20:31:38 -0800 (PST)
Date: Wed, 28 Dec 2022 20:31:37 -0800 (PST)
From: =?UTF-8?B?5byg5a626ZOt?= <j.jyaming@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <33d8c3a8-ad55-41b9-8985-ee6aec05ddd6n@googlegroups.com>
In-Reply-To: <21effb9c-e2da-b611-3318-03646d749cd9@oth-regensburg.de>
References: <71033b4d-67fd-4aad-9605-cb4c01b2c01an@googlegroups.com>
 <21effb9c-e2da-b611-3318-03646d749cd9@oth-regensburg.de>
Subject: Re: Help: About jailhouse cell stats XXX
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_23692_1816710916.1672288297981"
X-Original-Sender: j.jyaming@gmail.com
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

------=_Part_23692_1816710916.1672288297981
Content-Type: multipart/alternative; 
	boundary="----=_Part_23693_1246579667.1672288297981"

------=_Part_23693_1246579667.1672288297981
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thank you, very helpful to me !

Jiaming

=E5=9C=A82022=E5=B9=B412=E6=9C=8827=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C UTC=
+8 18:28:06<Ralf Ramsauer> =E5=86=99=E9=81=93=EF=BC=9A

> Hi,
>
> On 27/12/2022 04:22, =E5=BC=A0=E5=AE=B6=E9=93=AD wrote:
> > Hi,
> >=20
> > When I used command `jailhouse cell stats XXX` to evaluate jailhouse=20
> > cells, I ran into a problem. Does this command provide additional=20
> > options to output the result to a file? If not, how could I do to get=
=20
> > the file to show/record result?
>
> you can access statistics in /sys/devices/jailhouse/...
>
> Ralf
>
> >=20
> > Thanks,
> > Jiaming
> >=20
> > --=20
> > You received this message because you are subscribed to the Google=20
> > Groups "Jailhouse" group.
> > To unsubscribe from this group and stop receiving emails from it, send=
=20
> > an email to jailhouse-de...@googlegroups.com=20
> > <mailto:jailhouse-de...@googlegroups.com>.
> > To view this discussion on the web visit=20
> >=20
> https://groups.google.com/d/msgid/jailhouse-dev/71033b4d-67fd-4aad-9605-c=
b4c01b2c01an%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/71033b4d-67fd-4aad-9605-c=
b4c01b2c01an%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/33d8c3a8-ad55-41b9-8985-ee6aec05ddd6n%40googlegroups.com.

------=_Part_23693_1246579667.1672288297981
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,<div><br></div><div>Thank you, very helpful to me !</div><div><br></div>=
<div>Jiaming<br><br></div><div class=3D"gmail_quote"><div dir=3D"auto" clas=
s=3D"gmail_attr">=E5=9C=A82022=E5=B9=B412=E6=9C=8827=E6=97=A5=E6=98=9F=E6=
=9C=9F=E4=BA=8C UTC+8 18:28:06&lt;Ralf Ramsauer> =E5=86=99=E9=81=93=EF=BC=
=9A<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8e=
x; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">Hi,
<br>
<br>On 27/12/2022 04:22, =E5=BC=A0=E5=AE=B6=E9=93=AD wrote:
<br>&gt; Hi,
<br>&gt;=20
<br>&gt; When I used command `jailhouse cell stats XXX` to evaluate jailhou=
se=20
<br>&gt; cells, I ran into a problem. Does this command provide additional=
=20
<br>&gt; options to output the result to a file? If not, how could I do to =
get=20
<br>&gt; the file to show/record result?
<br>
<br>you can access statistics in /sys/devices/jailhouse/...
<br>
<br>   Ralf
<br>
<br>&gt;=20
<br>&gt; Thanks,
<br>&gt; Jiaming
<br>&gt;=20
<br>&gt; --=20
<br>&gt; You received this message because you are subscribed to the Google=
=20
<br>&gt; Groups &quot;Jailhouse&quot; group.
<br>&gt; To unsubscribe from this group and stop receiving emails from it, =
send=20
<br>&gt; an email to <a href data-email-masked rel=3D"nofollow">jailhouse-d=
e...@googlegroups.com</a>=20
<br>&gt; &lt;mailto:<a href data-email-masked rel=3D"nofollow">jailhouse-de=
...@googlegroups.com</a>&gt;.
<br>&gt; To view this discussion on the web visit=20
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/71033b4=
d-67fd-4aad-9605-cb4c01b2c01an%40googlegroups.com" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dzh-CN&am=
p;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/71033b4d-67fd-4aad-96=
05-cb4c01b2c01an%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D16723746=
20253000&amp;usg=3DAOvVaw37N26Ucj_c7I7lJN3SGE95">https://groups.google.com/=
d/msgid/jailhouse-dev/71033b4d-67fd-4aad-9605-cb4c01b2c01an%40googlegroups.=
com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/7103=
3b4d-67fd-4aad-9605-cb4c01b2c01an%40googlegroups.com?utm_medium=3Demail&amp=
;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirectu=
rl=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps://groups.google.c=
om/d/msgid/jailhouse-dev/71033b4d-67fd-4aad-9605-cb4c01b2c01an%2540googlegr=
oups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;us=
t=3D1672374620253000&amp;usg=3DAOvVaw2FiWU0hoYMHfm8wqb39svS">https://groups=
.google.com/d/msgid/jailhouse-dev/71033b4d-67fd-4aad-9605-cb4c01b2c01an%40g=
ooglegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/33d8c3a8-ad55-41b9-8985-ee6aec05ddd6n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/33d8c3a8-ad55-41b9-8985-ee6aec05ddd6n%40googlegroups.co=
m</a>.<br />

------=_Part_23693_1246579667.1672288297981--

------=_Part_23692_1816710916.1672288297981--
