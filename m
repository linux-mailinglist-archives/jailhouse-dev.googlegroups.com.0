Return-Path: <jailhouse-dev+bncBCJ7NNNA3ADBBR5S4PVQKGQE5XB43LY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33c.google.com (mail-ot1-x33c.google.com [IPv6:2607:f8b0:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCD1AFB53
	for <lists+jailhouse-dev@lfdr.de>; Wed, 11 Sep 2019 13:23:52 +0200 (CEST)
Received: by mail-ot1-x33c.google.com with SMTP id e21sf12440848otq.23
        for <lists+jailhouse-dev@lfdr.de>; Wed, 11 Sep 2019 04:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=z8wNYjElrnTNex4MOGzAzXV6S7T5ab5UOWYS1K6L0Lc=;
        b=Fd/MsIeD3qanzGcdaZOkG04rCab5ZWz5g+AW8RMb/j9umQ0zlsUzwoRJ8Y5vXCqTTW
         zEnGNMMpECjLSMsNXCR0n1G7lc3d4QCfIej/I+1pkq2hAIRx9e10bGh1dVw5XfzVKPEs
         DHox+wqaTSm94Ah/p380tQS0c8KYyKJJo86vUABZjF1FVYubodQeOw1161vT+ldMh1av
         TyUie6+neq0ZMB6ebznBDIw8QOEMXEYkhKPYvnTLtuB87QBc9WPnNSxFdsGageq8ifGZ
         SEzwkyqAfG1o8QzqrwslrGZEZGGswryCxTttZ6Gplxib+utXnAyFaUBEvkDcgpZW+WPc
         ODTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=z8wNYjElrnTNex4MOGzAzXV6S7T5ab5UOWYS1K6L0Lc=;
        b=RvsYtYfgjt3fORpeTzjfmeLCr8SXJHmQre8CYm4VKrzgXOg1uHfAusiICdVAfn4v5E
         do9gqMfch3CXHIcvjhNrr0sbrUJgLTkajk6Dk9Ocs7PF2lXBWUJO0Us9EJN7106h5OVu
         4qINwp5wTTAI+kt5glRpunbpQkDvIpIUi61JxaRXRtEgFIcOqnReDfEOf2oH2eBAAKpY
         nm8I0QRMjGpn+RasGOGOZGsJ9EqKMk/w6AFQCPoWsQJ6GGJh5zQ7ZlgBTvWkOxGU7Li0
         O+BCTw2wTAc6eIr9ZXgs8Nsmb0Qbd/G7EsBd4tK3DBI8yS92SznIsmvLdWr2nzdjgGtm
         3Mzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=z8wNYjElrnTNex4MOGzAzXV6S7T5ab5UOWYS1K6L0Lc=;
        b=KSVHCv0gThRlNa88PAjaJSQwS4xQ89R2nc7yP7rfbuDx5veMmLL3Yyb3IgYNt0/FRP
         qI8VYPkQO4HJ9Zg7w6xgjFPJkbJJv9jpRr1aN8Z2G7h/rympws0/GWnA4IV92waH2+X5
         tFpEefTOs+JJNF7bPK1Zr5lLXW2LFMsue5V/TXA2uhvfvVesoyBZgWj9WUSCFyD9H/am
         VeBe1fa0oG2EuwvLRxoRmGnW8qK0VKakTzO0HnMr/uQKLtFZskhu9WjFbrbkpCLdb8vq
         EZIFSyRQTOtI7t8o1nXfPF3unAnHKTwnM+uWavF4DflIUcu663CgLZsnpJX+tNVmOkE9
         KnEA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVQR7U9LUVwb9LDZWKsq2WvBcSnbd1BdlUPSAFukOTVITV9Cs9b
	KebxwNVouDC70l0viNscNHQ=
X-Google-Smtp-Source: APXvYqwdIkic5MSL3DCdHfNyCTQVJelw2XYJNbopnShumQ+2j0WUlj9on/PfivHtKizyNv+BJqFTRg==
X-Received: by 2002:aca:2208:: with SMTP id b8mr3412569oic.80.1568201031487;
        Wed, 11 Sep 2019 04:23:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:5a07:: with SMTP id v7ls149090oth.7.gmail; Wed, 11 Sep
 2019 04:23:51 -0700 (PDT)
X-Received: by 2002:a05:6830:1e19:: with SMTP id s25mr855815otr.350.1568201030890;
        Wed, 11 Sep 2019 04:23:50 -0700 (PDT)
Date: Wed, 11 Sep 2019 04:23:50 -0700 (PDT)
From: Peter Smith <salerio@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <e5e387e0-eeba-4719-bf73-5e16f65f4d63@googlegroups.com>
Subject: Compilation error (jailhouse.c) in Yocto build
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2838_1251920523.1568201030336"
X-Original-Sender: salerio@gmail.com
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

------=_Part_2838_1251920523.1568201030336
Content-Type: multipart/alternative; 
	boundary="----=_Part_2839_299396338.1568201030336"

------=_Part_2839_299396338.1568201030336
Content-Type: text/plain; charset="UTF-8"

Apologize if this is a stupid question.

I am trying to build jailhouse as part of a Yocto (thud) build for the US+ 
MPSoC. I have based my recipe on one found in meta-ti/kernel/jailhouse as 
it seemed to be the most up to date recipe I could find. 

The recipe builds using the following:

EXTRA_OEMAKE = "ARCH=${JH_ARCH} CROSS_COMPILE=${TARGET_PREFIX} 
KDIR=${STAGING_KERNEL_BUILDDIR}"

do_compile() {
oe_runmake V=1
}


Everything proceeds well until the make process reaches the tools directory 
where I get a compilation errors complaining about a missing <stdio.h> 
which Is rather odd I thought.


| 
/build1/peter/PE2/ZCU/build/tmp/work/zcu102_zynqmp-poky-linux/jailhouse/0.11+gitAUTOINC+955a9418df-r0/git/tools/jailhouse-gcov-extract.c:13:10: 
fatal error: stdio.h: No such file or directory
|  #include <stdio.h>
|           ^~~~~~~~~
| compilation terminated.
| 
/build1/peter/PE2/ZCU/build/tmp/work/zcu102_zynqmp-poky-linux/jailhouse/0.11+gitAUTOINC+955a9418df-r0/git/tools/jailhouse.c:14:10: 
fatal error: stdio.h: No such file or directory
|  #include <stdio.h>
|           ^~~~~~~~~
| compilation terminated.

So my question is, is this expected behavior?

Can the tools be built via Yocto?

Best Regards
Peter

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e5e387e0-eeba-4719-bf73-5e16f65f4d63%40googlegroups.com.

------=_Part_2839_299396338.1568201030336
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Apologize if this is a stupid question.<div><br></div><div=
>I am trying to build jailhouse as part of a Yocto (thud) build for the US+=
 MPSoC. I have based my recipe on one found in meta-ti/kernel/jailhouse as =
it seemed to be the most up to date recipe I could find.=C2=A0<div><br></di=
v><div>The recipe builds using the following:</div><div><br></div><div><div=
>EXTRA_OEMAKE =3D &quot;ARCH=3D${JH_ARCH} CROSS_COMPILE=3D${TARGET_PREFIX} =
KDIR=3D${STAGING_KERNEL_BUILDDIR}&quot;</div><div><br></div><div><div>do_co=
mpile() {</div><div><span style=3D"white-space:pre">	</span>oe_runmake V=3D=
1</div><div>}</div></div><div><br></div><div><br></div><div>Everything proc=
eeds well until the make process reaches the tools directory where I get a =
compilation errors complaining about a missing &lt;stdio.h&gt; which Is rat=
her odd I thought.<div><br><div><br></div><div><div>| /build1/peter/PE2/ZCU=
/build/tmp/work/zcu102_zynqmp-poky-linux/jailhouse/0.11+gitAUTOINC+955a9418=
df-r0/git/tools/jailhouse-gcov-extract.c:13:10: fatal error: stdio.h: No su=
ch file or directory</div><div>|=C2=A0 #include &lt;stdio.h&gt;</div><div>|=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~</div><div>| compilation =
terminated.</div></div><div><div>| /build1/peter/PE2/ZCU/build/tmp/work/zcu=
102_zynqmp-poky-linux/jailhouse/0.11+gitAUTOINC+955a9418df-r0/git/tools/jai=
lhouse.c:14:10: fatal error: stdio.h: No such file or directory</div><div>|=
=C2=A0 #include &lt;stdio.h&gt;</div><div>|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^~~~~~~~~</div><div>| compilation terminated.</div></div><div><br=
></div><div>So my question is, is this expected behavior?</div><div><br></d=
iv><div>Can the tools be built via Yocto?</div></div></div></div><div><br><=
/div><div>Best Regards</div><div>Peter</div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/e5e387e0-eeba-4719-bf73-5e16f65f4d63%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/e5e387e0-eeba-4719-bf73-5e16f65f4d63%40googlegroups.com<=
/a>.<br />

------=_Part_2839_299396338.1568201030336--

------=_Part_2838_1251920523.1568201030336--
