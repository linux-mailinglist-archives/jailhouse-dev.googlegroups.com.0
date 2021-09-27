Return-Path: <jailhouse-dev+bncBCWJRXUWVQPBBYWMY6FAMGQESGIT67Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x840.google.com (mail-qt1-x840.google.com [IPv6:2607:f8b0:4864:20::840])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D5441981D
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Sep 2021 17:42:27 +0200 (CEST)
Received: by mail-qt1-x840.google.com with SMTP id w10-20020ac87e8a000000b002a68361412bsf75131368qtj.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Sep 2021 08:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Nr1exwQjckUnqgVKA6WIG7185BIj/jL4UwIeWVveNsQ=;
        b=NF3Dee6yZbWJ+OQa4WDDmP5kwLjPbhNBAYs+eGWu1HDblQ99ras5nHOGrXrQngm2zU
         Rj6RG4DbxMdbnObJAFkCXR+aKI9I38TFu1c0FxJUnXC0W4vRopjj1aSIVLkHc8ZAMC+5
         KrhpH8WkmmpbOzdmAfHYxp7SCLwyGfIRQCMbarwtwRGiy8Xo9nzaRSc+LALVsONpQOuF
         9VmXjZKGsA0Ak/8puV1M8Z4Xn/0w9xz1LI/nbSxPYUaXYmSKLpktn+CVkiOhNOdrYot7
         0MmeKTFeHEb39/veCNgHLuWGEiEtJlsKqIa24kTvTPrmy8VA1XU4n+/tVOlovF2FmfHv
         UECw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Nr1exwQjckUnqgVKA6WIG7185BIj/jL4UwIeWVveNsQ=;
        b=LWW28r+zTLF5pEtQI0jawRtC0wqIWLvtnH/BUyMIjDB9jpgq5v3E4FXBkQvDqftDEB
         jkpC4+1h6/T92cHh280oBUpwotupvocsbvKuk9RlVhz5rzfC9KgHLb7YJh0hft5MASWr
         1aigpm3S0pkTVgZeKPw8svCOse/fJuSGDs64yfv12Vp+gA40cpbYPZSVq6bynIMCMi9C
         vvftWkfbnaYYJC48vtC5ZVSkIIhUKJ+SsqvHMBXcPJCEX6zjYmoi563gxJRrAOjQ46xo
         nfq6ebTYsKNaGGdaGVlQe3mSUChl3moH8cqiezjTqOsnZrEcE06kzoYa4Xd1Zoc+sR3d
         VVew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Nr1exwQjckUnqgVKA6WIG7185BIj/jL4UwIeWVveNsQ=;
        b=gOdq4DpSIX3ujLr2q/HEgoauf7s7F3j1dP5JY3RF5lN+7XNfgyTMMGvdFornHd1reA
         SbvcwPmAsO192YMe+lGx0GuJzStPcuG3It4syvs8JCdg9n5dEg6O4Nx8ol+N+uFdX2jN
         VzbOsZFu/m2X48JqSCOZrw4A9V0iySPD/a52P/3qD35NEL3nUVrFsVPCOJD4NpGsQ3GW
         kNHaccDo+cTqPswVAg64OdLJItv7/fkYcYRmBH2LGYCtjlMJdkE3YnsIsCTzEkRIlS+3
         97U7oPRWChFaeSbC1vshIN+62ojXcmHuAJVntryuB51udp+kqiSYxCQjm9x7qq7RKnGV
         8MUg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531zsnVHbrwCPPxL2xSZ0Kl4e0PCfZfXwib+EbApXZChzgHja/t9
	ehdoPjLIf8AtyPeJK5KqSiE=
X-Google-Smtp-Source: ABdhPJxS036VkPSvlEDENKNhX1bpgVDPAV2e+7CZXcJni5/ef301HRcsIMQM8qykZ6z5PizVZX0Reg==
X-Received: by 2002:a37:b606:: with SMTP id g6mr626333qkf.328.1632757346762;
        Mon, 27 Sep 2021 08:42:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:7006:: with SMTP id x6ls10370600qtm.3.gmail; Mon, 27 Sep
 2021 08:42:25 -0700 (PDT)
X-Received: by 2002:aed:27d9:: with SMTP id m25mr500476qtg.85.1632757345320;
        Mon, 27 Sep 2021 08:42:25 -0700 (PDT)
Date: Mon, 27 Sep 2021 08:42:24 -0700 (PDT)
From: jiajun huang <huangjiajun145041@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <09168d73-6852-4b4f-b1ef-97d6204ae3dan@googlegroups.com>
In-Reply-To: <AS8PR02MB66633DD8003EB0A9403A3ED3B6A79@AS8PR02MB6663.eurprd02.prod.outlook.com>
References: <AQHXsob2wEn+XHosI0Kv0I69aqWsbqu3f+dw>
 <2387af87-2391-4dff-b826-831ffac4d536n@googlegroups.com>
 <AS8PR02MB66633DD8003EB0A9403A3ED3B6A79@AS8PR02MB6663.eurprd02.prod.outlook.com>
Subject: Re: Crash when creating root cell in x86 -----FATAL: Invalid PIO
 read, port: 5658 size: 4
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4420_1714465735.1632757344683"
X-Original-Sender: huangjiajun145041@gmail.com
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

------=_Part_4420_1714465735.1632757344683
Content-Type: multipart/alternative; 
	boundary="----=_Part_4421_1208477026.1632757344683"

------=_Part_4421_1208477026.1632757344683
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi=EF=BC=8C
Thanks! Your suggestion is very useful. I have solved this problem with the=
=20
help of your linkage. jailhouse's default sysconfig.c seems can not be used=
=20
directly.
Thanks,
Jiajun

=E5=9C=A82021=E5=B9=B49=E6=9C=8827=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=80 UTC+=
8 =E4=B8=8B=E5=8D=883:44:35<Bram Hooimeijer> =E5=86=99=E9=81=93=EF=BC=9A

> > Hi,=20
> > When I tried to execute jailhouse enable sysconfig.cell on x86 platform=
,=20
> the machine crashed later. This happens in QEMU as well. So I dumped the=
=20
> logs in QEMU and found that there was an error when jailhouse accessed po=
rt=20
> 5658 through PIO. Attached is the detailed log information. By the way, m=
y=20
> CPU is i5-9600K.
>
> Hi,=20
>
> For debugging, please add your sysconfig.c as well. I expect the error ca=
n=20
> be=20
> Fixed by enabling access to PIO range in the corresponding array in=20
> sysconfig.c.
>
> More on this can be found here,
>
> https://events.static.linuxfound.org/sites/events/files/slides/ELCE2016-J=
ailhouse-Tutorial.pdf
>
> Jan's talk can be found online as well, if you rather listen to it.=20
>
> Good luck, Bram
>
> >=20
> > thanks=EF=BC=8C
> > Jiajun
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/09168d73-6852-4b4f-b1ef-97d6204ae3dan%40googlegroups.com.

------=_Part_4421_1208477026.1632757344683
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi=EF=BC=8C<div>Thanks! Your suggestion is very useful. I have solved this =
problem with the help of your linkage. jailhouse's default sysconfig.c seem=
s can not be used directly.</div><div>Thanks,</div><div>Jiajun<br><br></div=
><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">=E5=9C=
=A82021=E5=B9=B49=E6=9C=8827=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=80 UTC+8 =E4=
=B8=8B=E5=8D=883:44:35&lt;Bram Hooimeijer> =E5=86=99=E9=81=93=EF=BC=9A<br/>=
</div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; borde=
r-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">&gt; Hi,=20
<br>&gt; When I tried to execute jailhouse enable sysconfig.cell on x86 pla=
tform, the machine crashed later. This happens in QEMU as well. So I dumped=
 the logs in QEMU and found that there was an error when jailhouse accessed=
 port 5658 through PIO. Attached is the detailed log information. By the wa=
y, my CPU is i5-9600K.
<br>
<br>Hi,=20
<br>
<br>For debugging, please add your sysconfig.c as well. I expect the error =
can be=20
<br>Fixed by enabling access to PIO range in the corresponding array in=20
<br>sysconfig.c.
<br>
<br>More on this can be found here,
<br><a href=3D"https://events.static.linuxfound.org/sites/events/files/slid=
es/ELCE2016-Jailhouse-Tutorial.pdf" target=3D"_blank" rel=3D"nofollow" data=
-saferedirecturl=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps://e=
vents.static.linuxfound.org/sites/events/files/slides/ELCE2016-Jailhouse-Tu=
torial.pdf&amp;source=3Dgmail&amp;ust=3D1632843150137000&amp;usg=3DAFQjCNFV=
5_bdcfdWMmisa7f5X_y_7yISjQ">https://events.static.linuxfound.org/sites/even=
ts/files/slides/ELCE2016-Jailhouse-Tutorial.pdf</a>
<br>
<br>Jan&#39;s talk can be found online as well, if you rather listen to it.=
=20
<br>
<br>Good luck, Bram
<br>
<br>&gt;=20
<br>&gt; thanks=EF=BC=8C
<br>&gt;  Jiajun
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/09168d73-6852-4b4f-b1ef-97d6204ae3dan%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/09168d73-6852-4b4f-b1ef-97d6204ae3dan%40googlegroups.co=
m</a>.<br />

------=_Part_4421_1208477026.1632757344683--

------=_Part_4420_1714465735.1632757344683--
