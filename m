Return-Path: <jailhouse-dev+bncBDPODWHAYYOBB24QZGCAMGQEW4LJR3A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf37.google.com (mail-qv1-xf37.google.com [IPv6:2607:f8b0:4864:20::f37])
	by mail.lfdr.de (Postfix) with ESMTPS id A0324373586
	for <lists+jailhouse-dev@lfdr.de>; Wed,  5 May 2021 09:25:32 +0200 (CEST)
Received: by mail-qv1-xf37.google.com with SMTP id 99-20020a0c80ec0000b029017de514d56fsf1087384qvb.17
        for <lists+jailhouse-dev@lfdr.de>; Wed, 05 May 2021 00:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=xBXdKM4pCyspbdXmxivEK584UBK2IlfPeYzPeaq/R5w=;
        b=WJx1WJphyhKHYDAFaJkWbKCMyJY2vsCVKbbfUoFpq9GYkN1Xe35VsE6o3RBpv8G303
         qZnIXppMuvAZ52LgBr0OiJ0bL2aee6HnVEcEIGWsDb9g9oynp1z0XeUQiiQiHnPiz6BA
         26AlEV5aeEwK3w1Jta2+Cmkf3ZW7m+Sl7exv6XMXiWPsfQBteQRYxUkZmYSDvrbU+t41
         aZOc5gW3AbXMTTAM2Hg+NLD8StEn17WbA0gsKYYlYSN1OWNBL78WKN4qjnL62Jd49R5+
         riD+AoYtoj+t2FaZn7CUKp0RNR6Ti53U1lr0hyIaybvJeLn8wyeCAaib4m57um0LtKaM
         mxTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=xBXdKM4pCyspbdXmxivEK584UBK2IlfPeYzPeaq/R5w=;
        b=ON+Q8QsWCb2JUlWVELWFyWrgNgozG8T8cs5g24c4k8q0VxFrlmYCXLp3PDfDH9g+fk
         mRZAzfgS51pQThyb6uDFemY7aw+83bqD/bwevoxrv+EwT3tgMmQ6BNrtO8DlO6oXrwLM
         MPgGoSgq25b0N/WUOJAgZ+w0cy8dvh5QmV6n1gZ8whuYP6/1Yck70qKw+Zmtljml5nKH
         qMA/GM+b1OrHVczUZ5rtB5AxU0Hcm0ajNw2kx+GwbFDotLzmfmjVOgJDJ+05uGjqKSnl
         N20ZeOEwIDS8ZdPReyQSRzUUgp/RyA60VIlCildGsCVPlDqrOrFYcJZvIatFzL9Hn328
         FIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=xBXdKM4pCyspbdXmxivEK584UBK2IlfPeYzPeaq/R5w=;
        b=KacFWojss/5vkFZSoJxk7mJRTXJ324U+zWL5sZ7rAMe9t4gP+FWylacewGgZT3jfzL
         FP0SHdh6bjZy3NsPmqfHj7YreCCx4gKF8V2hGnCMka9k9+kBNTbGcR5xFWcGN78P1FqJ
         M8gksfSr37MvvaWurMFvNeykTW78D+zeSTwAJPfRpsNg50KzqwwvEPH/Ddw5c7yyLa6O
         qOMQ4UD2+Nb0ca6qBN28VpcSGeEQLFxl9ACAWg8DG6JfwiINpVWrAgLqmd+xHkU+XH+m
         WCbRzLNcwL3tJXpChF7pyfx71GvdGsaRlYppn9yrUycxQ3bPI4kgP4/SzWmpvQx+CVrq
         DaRw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5323qFLFDv9S95S91MDpulw4Y5omxPH/2EFBBUGG+XWW2bmC6A8w
	xXO+LCKeKGla2zeKYVqfu4Y=
X-Google-Smtp-Source: ABdhPJwxsLT1zwIrwbwl3ICNRxVVCiTJp2C/0QI3PSAJkxIC0M69PXZXp1u7cAvu03Y3dxV4/vnjcg==
X-Received: by 2002:a0c:9bda:: with SMTP id g26mr29132316qvf.44.1620199531577;
        Wed, 05 May 2021 00:25:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:e652:: with SMTP id c18ls6072998qvn.9.gmail; Wed, 05 May
 2021 00:25:31 -0700 (PDT)
X-Received: by 2002:a0c:8d07:: with SMTP id r7mr29414697qvb.7.1620199530888;
        Wed, 05 May 2021 00:25:30 -0700 (PDT)
Date: Wed, 5 May 2021 00:25:30 -0700 (PDT)
From: Stefano Gurrieri <gurrieristefano@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c2dffc36-35f4-43bf-8166-107f4fcae804n@googlegroups.com>
In-Reply-To: <eec6d53b-a974-69cb-6a0a-302db90b14f6@oth-regensburg.de>
References: <dd1ffb4f-3c78-4a8d-9982-7b589e0f3754n@googlegroups.com>
 <eec6d53b-a974-69cb-6a0a-302db90b14f6@oth-regensburg.de>
Subject: Re: use uart3 from inmate cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_588_1170561765.1620199530365"
X-Original-Sender: gurrieristefano@gmail.com
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

------=_Part_588_1170561765.1620199530365
Content-Type: multipart/alternative; 
	boundary="----=_Part_589_436322012.1620199530365"

------=_Part_589_436322012.1620199530365
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Ralf,

thanks for your advice. I've patched the driver=20
*inmates/lib/arm-common/uart-imx.c* and everything it works.

Speaking in general, I find a bit strange that there aren't drivers ready=
=20
to develop a bare-metal application into inmate cell (like for M4 into=20
MCUXpresso SDK).
Do you know if in the future there will be implemented this "software=20
layer"?
For example if I want to use other peripherals (SPI, I2C, etc...)... there=
=20
is something?

Thank you.
Waiting a feedback from you.
Regards.
Stefano

On Thursday, April 29, 2021 at 6:16:28 PM UTC+2 Ralf Ramsauer wrote:

> Hi Stefano,
>
> On 29/04/2021 10:45, Stefano Gurrieri wrote:
> > Hello,
> >=20
> > I=E2=80=99ve experimented succefully jailhouse on my target (var-som-mx=
8m-mini +
> > symphony carrier board); specifically I=E2=80=99ve tested a second linu=
x and
> > other demos (ivshmem-demo, gic-demo...).=20
> >=20
> > Furthermore, I=E2=80=99ve cross-compiled a very easy bare-metal applica=
tion, but
> > I=E2=80=99m not able to use UART3 (second uart) from this cell (linux r=
oot cell
> > send correctly debug messages on UART4 -first uart-). Attached you can=
=20
> find:
> >=20
> > - *imx8mm-uart-demo.c*                  my config cell
> >=20
> > - *uart-demo.c*                                   demo loaded into
> > inmate cell
> >=20
> > Runtime, after enabling jailhouse, I enter:
> >=20
> > jailhouse cell create /usr/share/jailhouse/cells/imx8mm-uart-demo.cell
> >=20
> > jailhouse cell load 1 /usr/share/jailhouse/inmates/uart-demo.bin
> >=20
> > jailhouse cell start 1
> >=20
> > In theory, I should be able to see =E2=80=9C/printk(=E2=80=9Dblablabla=
=E2=80=9D)/ messages on my
> > uart3 console (the second serial console), but I don=E2=80=99t see anyt=
hing.
> >=20
> > ***
> >=20
> > Questions:
> >=20
> > 1. Have you some idea? What I got wrong?
> >=20
> > 2. The config cell seems correct, but I=E2=80=99m asking who initialize=
 uart3
> > serial? Linux? Because if it=E2=80=99s linux, the uart3 is disabled in =
the dtb.
> > Is it possible initialize uart3 serial also into jailhouse?
>
> If it's disabled in the DT, and nobody initialised it before, then yes,
> there's a certain chance that the UART arrives unconfigured in the cell.
>
> Have a look at inmates/lib/arm-common/uart-imx.c . The init routine
> currently does nothing. IOW, you either need to patch the driver and add
> optional initialisation (you can have a look at other drivers, there are
> already appropriate fields in the config structures for uart
> configuration), or rely on Linux to hand it over initialised.
>
> Ralf
>
> >=20
> > Thanks a lot for your help in advance!
> >=20
> > Kind regards.
> >=20
> > Stefano
> >=20
> > --=20
> > You received this message because you are subscribed to the Google
> > Groups "Jailhouse" group.
> > To unsubscribe from this group and stop receiving emails from it, send
> > an email to jailhouse-de...@googlegroups.com
> > <mailto:jailhouse-de...@googlegroups.com>.
> > To view this discussion on the web visit
> >=20
> https://groups.google.com/d/msgid/jailhouse-dev/dd1ffb4f-3c78-4a8d-9982-7=
b589e0f3754n%40googlegroups.com
> > <
> https://groups.google.com/d/msgid/jailhouse-dev/dd1ffb4f-3c78-4a8d-9982-7=
b589e0f3754n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c2dffc36-35f4-43bf-8166-107f4fcae804n%40googlegroups.com.

------=_Part_589_436322012.1620199530365
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Ralf,<div><br></div><div>thanks for your advice. I've patched the dri=
ver <i>inmates/lib/arm-common/uart-imx.c</i> and everything it works.</div>=
<div><br></div><div>Speaking in general, I find a bit strange that there ar=
en't drivers ready to develop a bare-metal application into inmate cell (li=
ke for M4 into MCUXpresso SDK).</div><div>Do you know if in the future ther=
e will be implemented this "software layer"?</div><div>For example if I wan=
t to use other peripherals (SPI, I2C, etc...)... there is something?</div><=
div><br></div><div>Thank you.</div><div>Waiting a feedback from you.</div><=
div>Regards.</div><div>Stefano<br><br></div><div class=3D"gmail_quote"><div=
 dir=3D"auto" class=3D"gmail_attr">On Thursday, April 29, 2021 at 6:16:28 P=
M UTC+2 Ralf Ramsauer wrote:<br/></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padd=
ing-left: 1ex;">Hi Stefano,
<br>
<br>On 29/04/2021 10:45, Stefano Gurrieri wrote:
<br>&gt; Hello,
<br>&gt;=20
<br>&gt; I=E2=80=99ve experimented succefully jailhouse on my target (var-s=
om-mx8m-mini +
<br>&gt; symphony carrier board); specifically I=E2=80=99ve tested a second=
 linux and
<br>&gt; other demos (ivshmem-demo, gic-demo...).=C2=A0
<br>&gt;=20
<br>&gt; Furthermore, I=E2=80=99ve cross-compiled a very easy bare-metal ap=
plication, but
<br>&gt; I=E2=80=99m not able to use UART3 (second uart) from this cell (li=
nux root cell
<br>&gt; send correctly debug messages on UART4 -first uart-). Attached you=
 can find:
<br>&gt;=20
<br>&gt; -=C2=A0*imx8mm-uart-demo.c*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 my=C2=A0config cell
<br>&gt;=20
<br>&gt; -=C2=A0*uart-demo.c*=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0demo loaded into
<br>&gt; inmate cell
<br>&gt;=20
<br>&gt; Runtime, after enabling jailhouse, I enter:
<br>&gt;=20
<br>&gt; jailhouse cell create /usr/share/jailhouse/cells/imx8mm-uart-demo.=
cell
<br>&gt;=20
<br>&gt; jailhouse cell load 1 /usr/share/jailhouse/inmates/uart-demo.bin
<br>&gt;=20
<br>&gt; jailhouse cell start 1
<br>&gt;=20
<br>&gt; In theory, I should be able to see =E2=80=9C/printk(=E2=80=9Dblabl=
abla=E2=80=9D)/=C2=A0messages on my
<br>&gt; uart3 console (the second serial console), but I don=E2=80=99t see=
 anything.
<br>&gt;=20
<br>&gt; ***
<br>&gt;=20
<br>&gt; Questions:
<br>&gt;=20
<br>&gt; 1. Have you some idea? What I got wrong?
<br>&gt;=20
<br>&gt; 2. The config cell seems correct, but I=E2=80=99m asking who initi=
alize uart3
<br>&gt; serial? Linux? Because if it=E2=80=99s linux, the uart3 is disable=
d in the dtb.
<br>&gt; Is it possible initialize uart3 serial also into jailhouse?
<br>
<br>If it&#39;s disabled in the DT, and nobody initialised it before, then =
yes,
<br>there&#39;s a certain chance that the UART arrives unconfigured in the =
cell.
<br>
<br>Have a look at inmates/lib/arm-common/uart-imx.c . The init routine
<br>currently does nothing. IOW, you either need to patch the driver and ad=
d
<br>optional initialisation (you can have a look at other drivers, there ar=
e
<br>already appropriate fields in the config structures for uart
<br>configuration), or rely on Linux to hand it over initialised.
<br>
<br>  Ralf
<br>
<br>&gt;=20
<br>&gt; Thanks a lot for your help in advance!
<br>&gt;=20
<br>&gt; Kind regards.
<br>&gt;=20
<br>&gt; Stefano
<br>&gt;=20
<br>&gt; --=20
<br>&gt; You received this message because you are subscribed to the Google
<br>&gt; Groups &quot;Jailhouse&quot; group.
<br>&gt; To unsubscribe from this group and stop receiving emails from it, =
send
<br>&gt; an email to <a href data-email-masked rel=3D"nofollow">jailhouse-d=
e...@googlegroups.com</a>
<br>&gt; &lt;mailto:<a href data-email-masked rel=3D"nofollow">jailhouse-de=
...@googlegroups.com</a>&gt;.
<br>&gt; To view this discussion on the web visit
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/dd1ffb4=
f-3c78-4a8d-9982-7b589e0f3754n%40googlegroups.com" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den-US&am=
p;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/dd1ffb4f-3c78-4a8d-99=
82-7b589e0f3754n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D16202854=
50103000&amp;usg=3DAFQjCNEW5ly9QGTCsksje08AtVCo14s25g">https://groups.googl=
e.com/d/msgid/jailhouse-dev/dd1ffb4f-3c78-4a8d-9982-7b589e0f3754n%40googleg=
roups.com</a>
<br>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/dd1=
ffb4f-3c78-4a8d-9982-7b589e0f3754n%40googlegroups.com?utm_medium=3Demail&am=
p;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirect=
url=3D"https://www.google.com/url?hl=3Den-US&amp;q=3Dhttps://groups.google.=
com/d/msgid/jailhouse-dev/dd1ffb4f-3c78-4a8d-9982-7b589e0f3754n%2540googleg=
roups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;u=
st=3D1620285450103000&amp;usg=3DAFQjCNGOLlHlNAS3IERgHKSGjbK8rJzasw">https:/=
/groups.google.com/d/msgid/jailhouse-dev/dd1ffb4f-3c78-4a8d-9982-7b589e0f37=
54n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/c2dffc36-35f4-43bf-8166-107f4fcae804n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/c2dffc36-35f4-43bf-8166-107f4fcae804n%40googlegroups.co=
m</a>.<br />

------=_Part_589_436322012.1620199530365--

------=_Part_588_1170561765.1620199530365--
