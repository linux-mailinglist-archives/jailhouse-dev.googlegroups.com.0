Return-Path: <jailhouse-dev+bncBC7PTOEB2ALRBPP57CCAMGQEVN5JTVY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83a.google.com (mail-qt1-x83a.google.com [IPv6:2607:f8b0:4864:20::83a])
	by mail.lfdr.de (Postfix) with ESMTPS id 059193805ED
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 May 2021 11:11:27 +0200 (CEST)
Received: by mail-qt1-x83a.google.com with SMTP id j12-20020ac8550c0000b02901dae492d1f2sf13733298qtq.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 May 2021 02:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=IoNX2GVsxzS6fPXnOsiIbvGreluptppif91RPOf+VfY=;
        b=YMo75R1c1zOCp1YE9VPTixjcO86RVuor8p0/8VkYLpgN3EH23bW9rfUn9ZgcrH4nnW
         F50pNHlic4VEvgMTHVf191BijnSvptwnI2KqExr4NTVmh0Wm4QAulN6+qGmbNj3YjsRx
         wCQdbnRl4cbJp+aclCQV5j7fE0uMuWhoyKlwWiaciUmAP2TJvz4gROTWHVjLKTYjbzuw
         jOb2MIb9QRa1vQ31i9rGBWpotEVXnvP5mUzlirBilbTd9yvngVtyKyOIri4+NJTq0UaN
         O+/W6TU0Zp74p0OqB0XV4rtDKJv+oMDcDIxQCU7GUxnEc7wemrRiTft8unn0us3+lQkx
         x25w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=IoNX2GVsxzS6fPXnOsiIbvGreluptppif91RPOf+VfY=;
        b=CZYjtiqbcxjrGyxJuaDoecbnaadKYTI9bF5LEQf65viET0Y2+SZX/RMKGiElhyCf2/
         D7gLGMpFnMhjH0Cl7rYo1YmiNmT980jYPnxxjMEGdyBQzBHXglWxb6OtHrO/GrasfORD
         O016ajTyY8Y1Eeiq54q5yBLfdkbIi1HQvsvxsMkDiOqmoSXcBT19toXOpQWbJiTZnnbF
         keyJdUSki72o75czDcO1qwYq/UEm9smFH1UD+Qw2Z6/is5I6fBcKpKpnWf9o9Xavv98o
         /J6IQxpa0tI2ARCXfi75SrtPqQZ2eEzFFiEA5gve9PCu+cOSzkNj7dqjiFWdlNBQIJ+d
         GP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=IoNX2GVsxzS6fPXnOsiIbvGreluptppif91RPOf+VfY=;
        b=FxUXUV0iRPufYFbCeK8CTwaU6JPQ3M+rO6BuGWzHIjQEBWPWYz8vmgd6e03KB4PQhZ
         5nHj8GaVHrceV0Gnt5WxCtSNutrVGfOawyzooM9T8wFbK6PpqqlXnyAn5g1XTdturZCO
         f8L5kGpx6U+BDWP7i+PfLKwCLrGHtrRitsNoZD3mO4uZnV+VQdo2VtlZw6Q/68qY83Io
         tN6yW5XaKWc8Ek1RwFvk4FICRQPBmSSRVppb5UADltmYcUQKUolC/CCDu5tepXYURvLL
         k9SQVaEs/M6za2hhwkAVT//zSdPZ8qIkr72IGVG1aYiMvCSHmPviBdpzhfAW7M178AiH
         4dKQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533SOYk6TYOGSf097KDPAbkcXjzl1s7Atxx2ToxVb8CGAlbIg6ZZ
	VH/0uAIy2TvUEuoKFtmv+w4=
X-Google-Smtp-Source: ABdhPJyD6wOlsLERWQJJ7XANJrDvI+pb/DGLkmkt+4jo804jlcPzKz8Pu5kflr6QxrXZEA1lk0TQwA==
X-Received: by 2002:ac8:4447:: with SMTP id m7mr22958378qtn.55.1620983485910;
        Fri, 14 May 2021 02:11:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:5f44:: with SMTP id t65ls5574373qkb.0.gmail; Fri, 14 May
 2021 02:11:25 -0700 (PDT)
X-Received: by 2002:a37:9c50:: with SMTP id f77mr42644292qke.107.1620983485278;
        Fri, 14 May 2021 02:11:25 -0700 (PDT)
Date: Fri, 14 May 2021 02:11:24 -0700 (PDT)
From: along li <v6543210@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <22bbb8a9-2af9-4e79-9a71-81f20e8f564an@googlegroups.com>
In-Reply-To: <20210510123616.15344255@md1za8fc.ad001.siemens.net>
References: <299a190c-72fb-1027-0efc-7a45b98bffe0@cimware.in>
 <AS8PR02MB666300B8BE60E746F395D53DB6579@AS8PR02MB6663.eurprd02.prod.outlook.com>
 <CACNW3nS7kc-PwpimTmWFtF-MpFar+3Hsx7RFgOCtfpOOdxFszw@mail.gmail.com>
 <20210510123616.15344255@md1za8fc.ad001.siemens.net>
Subject: Re: Can Jailhouse work with CentOS
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_7022_280125295.1620983484811"
X-Original-Sender: v6543210@gmail.com
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

------=_Part_7022_280125295.1620983484811
Content-Type: multipart/alternative; 
	boundary="----=_Part_7023_304097047.1620983484811"

------=_Part_7023_304097047.1620983484811
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It's very easy to build jailhouse in Ubuntu 18.04.  But not ubuntu 20.04(=
=20
produce link error)

1.install kernel-header
2.build jailhouse
  make KDIR=3D/usr/src/linux-5.4.0       #KDIR is set to the linux src dir=
=20
or  header dir

3. install python and pip etc.
apt install python-pip
pip install wheel
pip install setuptools
pip install Flask
pip install mako


4. install jailhouse=20
sudo make install=20

jailhouse should be install sucess.
How to use ?=20
1.insmod   driver/jailhouse.ko
2.jailhouse enable configs/x86/machine.cell

--------------------------------------------------
The most  diffcult is how to write  good  machine.c to produce machine.cell=
.
May this help you !





=E5=9C=A82021=E5=B9=B45=E6=9C=8810=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=80 UTC+=
8 =E4=B8=8B=E5=8D=886:40:00<Henning Schild> =E5=86=99=E9=81=93=EF=BC=9A

> There is no reason for "sudo" for a simple "make". It is likely you are
> missing kernel sources, or tools that the build process needs. Or -
> given that distro - things are outdated. Jailhouse does not need much,
> but also centos does not offer much ;)
>
> try a fresh clone, no "sudo", "make V=3D1 -j1"
>
> Henning
>
> Am Sat, 8 May 2021 11:19:01 +0530
> schrieb Prashant Kalikotay <pk...@cimware.in>:
>
> > Thank you so much for your reply. While my installation I run sudo
> > make and that fails with the error : /path/to/build no such file or
> > directory is present. I checked the path/to/build and it exists and i
> > have also given superuser privileges to the user.
> > Could anyone get me anything on this. I am using CentOS 8.
> >=20
> > Regards,
> > Prashant K
> >=20
> > On Fri, 7 May 2021, 14:37 Bram Hooimeijer, <
> > bram.ho...@prodrive-technologies.com> wrote:
> >=20
> > >=20
> > > > Dear Sir/Madam,
> > > >
> > > > I am trying to install jailhouse in
> > > > CentOS=20
> > > but the installation did=20
> > > > not work or it did not get installed. Whereas when I tried to
> > > > install in=20
> > > Ubuntu=20
> > > > it readily installed. My query is does Jailhouse install in
> > > > CentOS or is=20
> > > there any=20
> > > > additional things to be done to install it?.=20
> > >
> > > What errors do you get? Maybe there's someone on the list who
> > > encountered those before.
> > >
> > > As far as I know, Jailhouse should run given that the kernel is
> > > properly configured.
> > > For newer Linux kernels, you might need some patches:
> > >=20
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fgit.ki=
szka.org%2F%3Fp%3Dlinux.git%3Ba%3Dsummary&amp;data=3D04%7C01%7Cde173c00-e98=
2-4fda-8644-47edf4671d63%40ad011.siemens.com%7C0e6b87ebf9ab493372b708d911e5=
04e8%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637560497853991126%7CUnkn=
own%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXV=
CI6Mn0%3D%7C2000&amp;sdata=3DppGRrGseipDA4Jlu%2BQkvXdFOCw5RKP8P6Y2LD6Nh4iY%=
3D&amp;reserved=3D0
> > > I have it running with minimal modifications on Linux 5.4
> > >
> > > Best, Bram Hooimeijer
> > >
> > >=20
> > > >
> > > > Thanking you in advance.
> > > >
> > > >
> > > > Regards,
> > > >
> > > > Prashant K
> > > >
> > > > --=20
> > >=20
> >=20
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/22bbb8a9-2af9-4e79-9a71-81f20e8f564an%40googlegroups.com.

------=_Part_7023_304097047.1620983484811
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It's very easy to build jailhouse in Ubuntu 18.04.&nbsp; But not ubuntu 20.=
04( produce link error)<div><br></div><div>1.install kernel-header</div><di=
v>2.build jailhouse</div><div>&nbsp; make KDIR=3D/usr/src/linux-5.4.0&nbsp;=
 &nbsp; &nbsp; &nbsp;#KDIR is set to the linux src dir or&nbsp; header dir<=
/div><div><br></div><div>3. install python and pip etc.</div><div><div>apt =
install python-pip</div><div>pip install wheel</div><div> pip install setup=
tools</div><div>pip install Flask</div><div>pip install mako</div></div><di=
v><br></div><div><br></div><div>4. install jailhouse&nbsp;</div><div>sudo m=
ake install&nbsp;</div><div><br></div><div>jailhouse should be install suce=
ss.</div><div>How to use ?&nbsp;</div><div>1.insmod&nbsp; &nbsp;driver/jail=
house.ko</div><div>2.jailhouse enable configs/x86/machine.cell<br></div><di=
v><br></div><div>--------------------------------------------------</div><d=
iv>The most&nbsp; diffcult is how to write&nbsp; good&nbsp; machine.c to pr=
oduce machine.cell.</div><div>May this help you !</div><div><br></div><div>=
<br></div><div><br></div><div><br><br></div><div class=3D"gmail_quote"><div=
 dir=3D"auto" class=3D"gmail_attr">=E5=9C=A82021=E5=B9=B45=E6=9C=8810=E6=97=
=A5=E6=98=9F=E6=9C=9F=E4=B8=80 UTC+8 =E4=B8=8B=E5=8D=886:40:00&lt;Henning S=
child> =E5=86=99=E9=81=93=EF=BC=9A<br/></div><blockquote class=3D"gmail_quo=
te" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204)=
; padding-left: 1ex;">There is no reason for &quot;sudo&quot; for a simple =
&quot;make&quot;. It is likely you are
<br>missing kernel sources, or tools that the build process needs. Or -
<br>given that distro - things are outdated. Jailhouse does not need much,
<br>but also centos does not offer much ;)
<br>
<br>try a fresh clone, no &quot;sudo&quot;, &quot;make V=3D1 -j1&quot;
<br>
<br>Henning
<br>
<br>Am Sat, 8 May 2021 11:19:01 +0530
<br>schrieb Prashant Kalikotay &lt;<a href data-email-masked rel=3D"nofollo=
w">pk...@cimware.in</a>&gt;:
<br>
<br>&gt; Thank you so much for your reply. While my installation I run sudo
<br>&gt; make and that fails with the error : /path/to/build no such file o=
r
<br>&gt; directory is present. I checked the path/to/build and it exists an=
d i
<br>&gt; have also given superuser privileges to the user.
<br>&gt; Could anyone get me anything on this. I am using CentOS 8.
<br>&gt;=20
<br>&gt; Regards,
<br>&gt; Prashant K
<br>&gt;=20
<br>&gt; On Fri, 7 May 2021, 14:37 Bram Hooimeijer, &lt;
<br>&gt; <a href data-email-masked rel=3D"nofollow">bram.ho...@prodrive-tec=
hnologies.com</a>&gt; wrote:
<br>&gt;=20
<br>&gt; &gt; =20
<br>&gt; &gt; &gt; Dear Sir/Madam,
<br>&gt; &gt; &gt;
<br>&gt; &gt; &gt;                              I am trying to install jail=
house in
<br>&gt; &gt; &gt; CentOS =20
<br>&gt; &gt; but the installation did =20
<br>&gt; &gt; &gt; not work or it did not get installed. Whereas when I tri=
ed to
<br>&gt; &gt; &gt; install in =20
<br>&gt; &gt; Ubuntu =20
<br>&gt; &gt; &gt; it readily installed. My query is does Jailhouse install=
 in
<br>&gt; &gt; &gt; CentOS or is =20
<br>&gt; &gt; there any =20
<br>&gt; &gt; &gt; additional things to be done to install it?. =20
<br>&gt; &gt;
<br>&gt; &gt; What errors do you get? Maybe there&#39;s someone on the list=
 who
<br>&gt; &gt; encountered those before.
<br>&gt; &gt;
<br>&gt; &gt; As far as I know, Jailhouse should run given that the kernel =
is
<br>&gt; &gt; properly configured.
<br>&gt; &gt; For newer Linux kernels, you might need some patches:
<br>&gt; &gt; <a href=3D"https://eur01.safelinks.protection.outlook.com/?ur=
l=3Dhttp%3A%2F%2Fgit.kiszka.org%2F%3Fp%3Dlinux.git%3Ba%3Dsummary&amp;amp;da=
ta=3D04%7C01%7Cde173c00-e982-4fda-8644-47edf4671d63%40ad011.siemens.com%7C0=
e6b87ebf9ab493372b708d911e504e8%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%=
7C637560497853991126%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2=
luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;amp;sdata=3DppGRrGseipDA4Jl=
u%2BQkvXdFOCw5RKP8P6Y2LD6Nh4iY%3D&amp;amp;reserved=3D0" target=3D"_blank" r=
el=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dzh-=
CN&amp;q=3Dhttps://eur01.safelinks.protection.outlook.com/?url%3Dhttp%253A%=
252F%252Fgit.kiszka.org%252F%253Fp%253Dlinux.git%253Ba%253Dsummary%26amp;da=
ta%3D04%257C01%257Cde173c00-e982-4fda-8644-47edf4671d63%2540ad011.siemens.c=
om%257C0e6b87ebf9ab493372b708d911e504e8%257C38ae3bcd95794fd4addab42e1495d55=
a%257C1%257C0%257C637560497853991126%257CUnknown%257CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%253D%257C2000%26amp;s=
data%3DppGRrGseipDA4Jlu%252BQkvXdFOCw5RKP8P6Y2LD6Nh4iY%253D%26amp;reserved%=
3D0&amp;source=3Dgmail&amp;ust=3D1621069491322000&amp;usg=3DAFQjCNHhaVT4b_5=
X8iwIknsuCzgYpKLcvg">https://eur01.safelinks.protection.outlook.com/?url=3D=
http%3A%2F%2Fgit.kiszka.org%2F%3Fp%3Dlinux.git%3Ba%3Dsummary&amp;amp;data=
=3D04%7C01%7Cde173c00-e982-4fda-8644-47edf4671d63%40ad011.siemens.com%7C0e6=
b87ebf9ab493372b708d911e504e8%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C=
637560497853991126%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2lu=
MzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;amp;sdata=3DppGRrGseipDA4Jlu%=
2BQkvXdFOCw5RKP8P6Y2LD6Nh4iY%3D&amp;amp;reserved=3D0</a>
<br>&gt; &gt; I have it running with minimal modifications on Linux 5.4
<br>&gt; &gt;
<br>&gt; &gt; Best, Bram Hooimeijer
<br>&gt; &gt;
<br>&gt; &gt; =20
<br>&gt; &gt; &gt;
<br>&gt; &gt; &gt; Thanking you in advance.
<br>&gt; &gt; &gt;
<br>&gt; &gt; &gt;
<br>&gt; &gt; &gt; Regards,
<br>&gt; &gt; &gt;
<br>&gt; &gt; &gt; Prashant K
<br>&gt; &gt; &gt;
<br>&gt; &gt; &gt; -- =20
<br>&gt; &gt; =20
<br>&gt;=20
<br>
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/22bbb8a9-2af9-4e79-9a71-81f20e8f564an%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/22bbb8a9-2af9-4e79-9a71-81f20e8f564an%40googlegroups.co=
m</a>.<br />

------=_Part_7023_304097047.1620983484811--

------=_Part_7022_280125295.1620983484811--
