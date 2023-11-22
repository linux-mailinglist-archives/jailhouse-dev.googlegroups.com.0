Return-Path: <jailhouse-dev+bncBCLNDZG33ILRBIVO62VAMGQEAVAWWII@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x439.google.com (mail-pf1-x439.google.com [IPv6:2607:f8b0:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7147F3DC2
	for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Nov 2023 06:52:36 +0100 (CET)
Received: by mail-pf1-x439.google.com with SMTP id d2e1a72fcca58-6cbca33ad5dsf606601b3a.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Nov 2023 21:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1700632355; x=1701237155; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:x-original-sender
         :mime-version:subject:references:in-reply-to:message-id:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M0JeSo3xjHqcxz2SxCPtW9nFU/hX2DgUVRwUecnC4+0=;
        b=gR4KQ8A+PJSTA4JF9V07q0bq0PMwwjd2eWoR0QWyLZvRWsNoH6OB/Y12blo0z6Q6zZ
         aGvINxmdnGdc6KDowJbDsU2znT33dPPW1fJ6kUchTN4pnD/Zjn9u246ERYgKXN9iyIIh
         aNhbv1pzvI1NStBKVtts0ArSoZ+jWSckvzY55UthShSyY3klSXKnK0jawz4N7Y43Nm5E
         Y7VIiO1QQTgW3aPh0a1w+WSS1PKpdtQ7geOUt8qtOPAnZL+yZyvKBFAcqRDyZnG2NJGn
         Inaf1CGUJGWlpLZOKuErhrhR0l5ociJLQCTRUUWTpLTnr01/ZFW5GTC2kiyQB9ngZsaj
         NROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700632355; x=1701237155;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence:reply-to
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0JeSo3xjHqcxz2SxCPtW9nFU/hX2DgUVRwUecnC4+0=;
        b=ilTDj3eUGBeB9RjkNr03Ls7QWLLaGZs0moSqSudAhGEPI01zERC7Hi6FtSDwW00UDl
         s4/YkVKe/hm0y9sY4oFgkMNfkBNFhpMKcB6qGDSWLEwZnwa/7Ddf8/B8NsfnWgOVKl8q
         sAdsPS3lo2OY5UouvWbX7GI2mtWa4oVaotLMFWKXEhf70YjgeAGecAxMLi9Ut8Xkazzz
         9lz9Vea5TapUSib74LzAe7uC38qEWkC1WFDCwfvC+1rpPdVwgqrsdOnMUoPg8djC+cMm
         XWML/2PFi0lukaxIwlmZANirJKRyiSgsLyavq6OLcxMFrSemTCv/xs+7l8PZ2GPbS0on
         JrFg==
X-Gm-Message-State: AOJu0YxDwUsque30dBY7s7cuaKJCkCZiKIe3JjmCrI132e6zZpfEogB3
	VBn1glWqhSivFLEy94VtQjY=
X-Google-Smtp-Source: AGHT+IH9qEOOFl1ENCCsjeRKpO/9jXMRFFpnvQv4evIY5wCQyU/NDCfTH8yv94geX0wQW5mXcr0iDw==
X-Received: by 2002:a05:6a00:26c7:b0:68f:cbd3:5b01 with SMTP id p7-20020a056a0026c700b0068fcbd35b01mr6382465pfw.13.1700632354708;
        Tue, 21 Nov 2023 21:52:34 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6a00:3a1d:b0:68a:47ec:f3fb with SMTP id
 fj29-20020a056a003a1d00b0068a47ecf3fbls5114081pfb.2.-pod-prod-04-us; Tue, 21
 Nov 2023 21:52:33 -0800 (PST)
X-Received: by 2002:a05:6a00:2d87:b0:6bc:f819:fcf6 with SMTP id fb7-20020a056a002d8700b006bcf819fcf6mr350417pfb.5.1700632353183;
        Tue, 21 Nov 2023 21:52:33 -0800 (PST)
Date: Tue, 21 Nov 2023 21:52:32 -0800 (PST)
From: =?UTF-8?B?J+W8oOW5sycgdmlhIEphaWxob3VzZQ==?= <jailhouse-dev@googlegroups.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <1550c8cb-c88a-4095-af1d-bd0f86ac68a6n@googlegroups.com>
In-Reply-To: <CAEfxd-9ruixKv7sB=EFhnH6Uw4GsYgDnpKjtCqBrRGtkbtxuSg@mail.gmail.com>
References: <ab8484e8-cb54-4c1b-ac78-ef67bb1bf4b3n@googlegroups.com>
 <CAEfxd-9ruixKv7sB=EFhnH6Uw4GsYgDnpKjtCqBrRGtkbtxuSg@mail.gmail.com>
Subject: =?UTF-8?Q?Re:_arm_cortex_A55_support=EF=BC=9F?=
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4830_33639140.1700632352183"
X-Original-Sender: 2022280902@qq.com
X-Original-From: =?UTF-8?B?5byg5bmz?= <2022280902@qq.com>
Reply-To: =?UTF-8?B?5byg5bmz?= <2022280902@qq.com>
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

------=_Part_4830_33639140.1700632352183
Content-Type: multipart/alternative; 
	boundary="----=_Part_4831_1664687282.1700632352183"

------=_Part_4831_1664687282.1700632352183
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am trying to transplant jailhouse on the A55 core, but now I have=20
encountered some problems. After I execute the following command, the=20
system will freeze.
$ jailhouse enable renesas-r9a07g044l2.cell

What are the possible consequences?

I made sure I did the following:
1.Linux kernel version 5.10
2.Linux starts in EL2
3. Turn on KVM
4. Turn off kernel CONFIG_ARM64_VHE

Best regards
zhang,

=E5=9C=A82023=E5=B9=B411=E6=9C=8822=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 UTC=
+8 11:04:24<Peng Fan> =E5=86=99=E9=81=93=EF=BC=9A

There is no difference to run jailhouse on A55 cores.

'=E5=BC=A0=E5=B9=B3' via Jailhouse <jailho...@googlegroups.com> =E4=BA=8E20=
23=E5=B9=B411=E6=9C=8820=E6=97=A5=E5=91=A8=E4=B8=80 13:47=E5=86=99=E9=81=93=
=EF=BC=9A


Hi All

I would like to know, are there any examples that are adapted to arm cortex=
=20
A55?
Or are there any SOCs that are arm cortex A55 and have successfully=20
transplanted the jailhouse program?

I saw that A57 and A53 products have suppressed jailhouse applications, but=
=20
I didn=E2=80=99t see A55?

Cheers,
Zhang

--=20
You received this message because you are subscribed to the Google Groups=
=20
"Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an=
=20
email to jailhouse-de...@googlegroups.com.
To view this discussion on the web visit=20
https://groups.google.com/d/msgid/jailhouse-dev/ab8484e8-cb54-4c1b-ac78-ef6=
7bb1bf4b3n%40googlegroups.com=20
<https://groups.google.com/d/msgid/jailhouse-dev/ab8484e8-cb54-4c1b-ac78-ef=
67bb1bf4b3n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>
.



--=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1550c8cb-c88a-4095-af1d-bd0f86ac68a6n%40googlegroups.com.

------=_Part_4831_1664687282.1700632352183
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am trying to transplant jailhouse on the A55 core, but now I have encount=
ered some problems. After I execute the following command, the system will =
freeze.<br />$ jailhouse enable renesas-r9a07g044l2.cell<br /><br />What ar=
e the possible consequences?<br /><br />I made sure I did the following:<br=
 />1.Linux kernel version 5.10<br />2.Linux starts in EL2<br />3. Turn on K=
VM<br />4. Turn off kernel CONFIG_ARM64_VHE<div><br /></div><div><span styl=
e=3D"color: rgb(0, 0, 0); font-family: =E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91=
, sans-serif; font-size: small;">Best regards</span></div><div><font color=
=3D"#000000" face=3D"=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91, sans-serif" size=
=3D"2">zhang,</font></div><br /><div><div dir=3D"auto">=E5=9C=A82023=E5=B9=
=B411=E6=9C=8822=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 UTC+8 11:04:24&lt;Peng=
 Fan&gt; =E5=86=99=E9=81=93=EF=BC=9A<br /></div><blockquote style=3D"margin=
: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-lef=
t: 1ex;"><div dir=3D"ltr">There is no difference to run jailhouse on A55 co=
res.</div><br /><div><div dir=3D"ltr">'=E5=BC=A0=E5=B9=B3' via Jailhouse &l=
t;<a href=3D"" rel=3D"nofollow">jailho...@googlegroups.com</a>&gt; =E4=BA=
=8E2023=E5=B9=B411=E6=9C=8820=E6=97=A5=E5=91=A8=E4=B8=80 13:47=E5=86=99=E9=
=81=93=EF=BC=9A<br /></div><blockquote style=3D"margin: 0px 0px 0px 0.8ex; =
border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"></blockquote=
></div><div><blockquote style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1p=
x solid rgb(204, 204, 204); padding-left: 1ex;"><br />Hi All<br /><br />I w=
ould like to know, are there any examples that are adapted to arm cortex A5=
5?<br />Or are there any SOCs that are arm cortex A55 and have successfully=
 transplanted the jailhouse program?<br /><br />I saw that A57 and A53 prod=
ucts have suppressed jailhouse applications, but I didn=E2=80=99t see A55?<=
br /><br />Cheers,<br />Zhang<br />

<p></p></blockquote></div><div><blockquote style=3D"margin: 0px 0px 0px 0.8=
ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">

-- <br />
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"" rel=3D"nofollow">jailhouse-de...@googlegroups.com</a>.=
<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/ab8484e8-cb54-4c1b-ac78-ef67bb1bf4b3n%40googlegrou=
ps.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D=
"nofollow">https://groups.google.com/d/msgid/jailhouse-dev/ab8484e8-cb54-4c=
1b-ac78-ef67bb1bf4b3n%40googlegroups.com</a>.<br />
</blockquote></div><br clear=3D"all" /><div><br /></div><span>-- </span><br=
 /><div dir=3D"ltr"><div dir=3D"ltr"><br /></div></div>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/1550c8cb-c88a-4095-af1d-bd0f86ac68a6n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/1550c8cb-c88a-4095-af1d-bd0f86ac68a6n%40googlegroups.co=
m</a>.<br />

------=_Part_4831_1664687282.1700632352183--

------=_Part_4830_33639140.1700632352183--
