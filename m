Return-Path: <jailhouse-dev+bncBCJ7NNNA3ADBBPXQ4PVQKGQEGPQRGRQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ua1-x937.google.com (mail-ua1-x937.google.com [IPv6:2607:f8b0:4864:20::937])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCE6AFDCB
	for <lists+jailhouse-dev@lfdr.de>; Wed, 11 Sep 2019 15:36:00 +0200 (CEST)
Received: by mail-ua1-x937.google.com with SMTP id f12sf554589uan.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 11 Sep 2019 06:36:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1568208959; cv=pass;
        d=google.com; s=arc-20160816;
        b=yTD6GYC7EyuYdmHq3pAnjzeKyBS13eV/6th6ivgMEtLnoKyr8o0oUds96kRt8YO062
         AMOBfZbXSF7RJyXlw3izMutB/PDWvZEabkB2NsMZ62ghwtTMdgluT6cUbUg+D3NkP1XF
         av1lJHBCJBrLnQmFrF9+fh1+/49kyXviiKFTBTo5E8SndEKePt0MtUGqA1sgLdksYbvW
         4tr4kSd3G5ZxUsxtRGCw7uL91N9PDcs7vh/80pw9Tai1XxsYexEaCzWKE1LSggZ9HTs4
         T5t/PZju2CM4qU1tWppmJeg3CLGCfLDqGF+3VDTGHXmN+itEwbZySNdGeBvxwyhoXfgX
         eqLA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=hIqCWuxkeMgQk9F5aecTedTfjWPPrhd1eayI4vWzXo0=;
        b=bwZyewAKH/Wxzq+YFV+Kh85erYPu7bZ4vFpY4Ew5UsOrX9r8kPwtMPNPzjzUOXMvxm
         UUoYjjKDSykXFwYS1nnGOmQbMXKkJ681hb0PUWcQIZtMoFciGpuTqblonHRVUTHeL+aq
         uBM59kZ6OFYo8ZJQU1uSCYgKYDzEaPhQigqDNUyaoMjWbjJ8M20YUf8qQbHQvMdYZg3F
         QjVZ9xnkve64WvTVI7IXTvI4OES1/Xynksu9WFV/4JavSa/GBypzsSylQ1hyL48CGlZb
         2yVBBVWon1Zu1IaOzEK/jqGFW4xmAluN/clI7Fy7Xy1n9WyFRwM5oBBwVUnyyyRpQr70
         eabw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ahQ0dIxr;
       spf=pass (google.com: domain of salerio@gmail.com designates 2607:f8b0:4864:20::e2a as permitted sender) smtp.mailfrom=salerio@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hIqCWuxkeMgQk9F5aecTedTfjWPPrhd1eayI4vWzXo0=;
        b=GoJ8eycUCTh8w9spaf8YAfxCFcYFzUM2B9rv3rrukbkBfCmah6gX3PBQICc01wqT52
         /viamLhGjmciUUdiYED4qcFhC69/6vw8uIjr/m+twQlp6OBDVCyF29zRvPF/Hx0AbOKo
         qw4doE36pRLX/y/NC5WRK9Ua4r/ASfFT1YGDx7JBfGJN7hdWTTI5bX4oj11tlGn1kOT6
         LdoxLlnXZ5yVQ+4ZqQTmOT8yDJGIO8iiO4QHDSwIHUVmJOGzxbrVZpGE205LrhhtAVL/
         uB+weL1NzwhG64+beMCuAwuAlF6wJoKuclrQNu2ebkubP5/LrzxJS+N4zkd9xnUTjBck
         KLyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hIqCWuxkeMgQk9F5aecTedTfjWPPrhd1eayI4vWzXo0=;
        b=ceNGCUYhKeun+yN8p6+nN93z8QDu73zkSSBsSWCHhiz37hQB3n1NOoclEaSDXX6tNO
         CfTpqfelDBSx4kTJ4D8ftmqvnm+DgGJol/QBiThCLGI5Q7h7GgaBSesnlJGHn5SQrghV
         vEAtSqx+yAvD81qiv1uOjGDV/s1nFxQcyK4Ud4GO8T12MAyq69r5hOrui7hHCA8CWu4g
         cJ2ZdYxPp/Est6QZJzejxcNZFCBNSjEG1Kaaks1zAf3UPIfldQS/M4JBmBTTptpoP09h
         YLKhSfC35r8jsSc46b/Bs0EcxJrhd+sFm79dP7l+pw6V2Qp5moxFsVNpUzuvc8yakWiD
         k+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hIqCWuxkeMgQk9F5aecTedTfjWPPrhd1eayI4vWzXo0=;
        b=sZXOBSXQNsvHrLinqF4lXO1WXCsx9yt7v3RjY65s7jgt2UH0EnJHTJPMm5WocQJsqW
         gVy85fHjmmIv3Ttj59ggyiHd68TAaMaFPnGw5TRViwqrYaedM0vBecfeixYHk6OW7CPx
         ZGgrJuvqC0Eg8sfCeZbBBeDdfdtbtbR8U0MCu0aXpobI692R0mjyyKT7zAFSdnPtMzvY
         L6QRUz58tsBayL5YT+x/AWTRUVT50bdVDXITdqtpuXn8zRbH1vWhS3hXAB9EGG1GoD35
         SnOvQ0rOS7Eigxbw1YX1rZXr+G1fDkCVqVqI9p3xq3rqRsAlza5D7F1u0M/3cn+nvwls
         JcCQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX8aQMPwyj7LdW/pV+MaBTP6uiiMdISxAcW6bTOq/7HN+eob5L+
	sQRWfCHg0HC/WyJf9oa44aE=
X-Google-Smtp-Source: APXvYqyBYhjfU+5Xs1+RPRZ8mYSkAedhwmaGUzX0ZaaFqThqmRA6pc8VgEEAeI3CD/8IsH1MUrA3lw==
X-Received: by 2002:ab0:2905:: with SMTP id v5mr17296714uap.57.1568208959166;
        Wed, 11 Sep 2019 06:35:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a67:c485:: with SMTP id d5ls2143035vsk.13.gmail; Wed, 11 Sep
 2019 06:35:58 -0700 (PDT)
X-Received: by 2002:a67:cd95:: with SMTP id r21mr19460532vsl.84.1568208958796;
        Wed, 11 Sep 2019 06:35:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568208958; cv=none;
        d=google.com; s=arc-20160816;
        b=tXPH2mxMrNLQ9SfoDQKfkugy7AS8HAwj1CMBjfT+GSKE2efG+GYUphBQZ52qoI4LP6
         cUMVra9jESvUg+yE/P58kGsBN93QPBFuihNCYB4IsmCN1oMYb81cCSoXL5MsaG9xti6h
         KO1ZMpx7pbKKDA3SNIYYBOqVkeueUbRj5zZ0uHE+LHzl8BYulW6nxD1/myvynROLyToR
         NrYY+AFJnS4y0I1WLp6sQgcS4PZFQFzEcYD+fc6iiKV/HxpyU3ixnds9g9P4BTuNwh7V
         j2rn4HHpx5naqiy7SS/V1Y+ohZkxM0JJzVy5QOOaJOqyICx28IZloicxedNEU5aX1KOY
         VUBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aKSX0qMs5KGPoH6kzv2bz0mMQTdUvEI8a01goLQt68o=;
        b=sSOpiIJocq+Xu1dpCSFG9qAjwEiDD/ZtFN67abqzEDtR+WD5hTKxUWrc8VoV7nViiJ
         98vk1/HZWlCygUAVEzk916nVYSqB+vi3ctc+5ov21xdNbXVhpOrX/NAi8XEUZISYZVQu
         cEscygwusUY/6WHucIRVSDZXbU/LZBTyjoXuf0dHy8OIyQ5OadGf8kgGFi+8alJm0Jhy
         WZRpwWLEGBfR0QsDem9Egk+Ktlt4AJCFUqnaa66Ub3tGj1tuV15P+FQWvijUv/XwtQUB
         uqclmGVhEUf8vZJ8WG9yyvO/Q+WRwUfvP0KvNPcai/NkLIjAqQIvTRVsc0UBAzZkPTJB
         ZdnA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ahQ0dIxr;
       spf=pass (google.com: domain of salerio@gmail.com designates 2607:f8b0:4864:20::e2a as permitted sender) smtp.mailfrom=salerio@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com. [2607:f8b0:4864:20::e2a])
        by gmr-mx.google.com with ESMTPS id 136si1375741vkx.4.2019.09.11.06.35.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2019 06:35:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of salerio@gmail.com designates 2607:f8b0:4864:20::e2a as permitted sender) client-ip=2607:f8b0:4864:20::e2a;
Received: by mail-vs1-xe2a.google.com with SMTP id g14so8191864vsp.1
        for <jailhouse-dev@googlegroups.com>; Wed, 11 Sep 2019 06:35:58 -0700 (PDT)
X-Received: by 2002:a67:60c5:: with SMTP id u188mr19170601vsb.153.1568208958483;
 Wed, 11 Sep 2019 06:35:58 -0700 (PDT)
MIME-Version: 1.0
References: <e5e387e0-eeba-4719-bf73-5e16f65f4d63@googlegroups.com> <00e5a697-7301-25f8-494d-04aa43d0b343@siemens.com>
In-Reply-To: <00e5a697-7301-25f8-494d-04aa43d0b343@siemens.com>
From: Peter Smith <salerio@gmail.com>
Date: Wed, 11 Sep 2019 14:35:22 +0100
Message-ID: <CAOx=Z6G31=FjMiNSNj8derZiZw-mwEvx8TdRGyMcY630nkOV6A@mail.gmail.com>
Subject: Re: Compilation error (jailhouse.c) in Yocto build
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="000000000000e773360592471964"
X-Original-Sender: salerio@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=ahQ0dIxr;       spf=pass
 (google.com: domain of salerio@gmail.com designates 2607:f8b0:4864:20::e2a as
 permitted sender) smtp.mailfrom=salerio@gmail.com;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--000000000000e773360592471964
Content-Type: text/plain; charset="UTF-8"

Thanks, I found some other layers to work from (
https://github.com/henning-schild-work/meta-jailhouse) also. I understand
why I was getting the error now, working through it all. New to Jailhouse.

Best Regards
Peter


On Wed, 11 Sep 2019 at 13:42, Jan Kiszka <jan.kiszka@siemens.com> wrote:

> On 11.09.19 13:23, Peter Smith wrote:
> > Apologize if this is a stupid question.
> >
> > I am trying to build jailhouse as part of a Yocto (thud) build for the
> US+
> > MPSoC. I have based my recipe on one found in meta-ti/kernel/jailhouse
> as it
> > seemed to be the most up to date recipe I could find.
> >
> > The recipe builds using the following:
> >
> > EXTRA_OEMAKE = "ARCH=${JH_ARCH} CROSS_COMPILE=${TARGET_PREFIX}
> > KDIR=${STAGING_KERNEL_BUILDDIR}"
> >
> > do_compile() {
> > oe_runmake V=1
> > }
> >
> >
> > Everything proceeds well until the make process reaches the tools
> directory
> > where I get a compilation errors complaining about a missing <stdio.h>
> which Is
> > rather odd I thought.
> >
> >
> > |
> >
> /build1/peter/PE2/ZCU/build/tmp/work/zcu102_zynqmp-poky-linux/jailhouse/0.11+gitAUTOINC+955a9418df-r0/git/tools/jailhouse-gcov-extract.c:13:10:
>
> > fatal error: stdio.h: No such file or directory
> > |  #include <stdio.h>
> > |           ^~~~~~~~~
> > | compilation terminated.
> > |
> >
> /build1/peter/PE2/ZCU/build/tmp/work/zcu102_zynqmp-poky-linux/jailhouse/0.11+gitAUTOINC+955a9418df-r0/git/tools/jailhouse.c:14:10:
>
> > fatal error: stdio.h: No such file or directory
> > |  #include <stdio.h>
> > |           ^~~~~~~~~
> > | compilation terminated.
> >
> > So my question is, is this expected behavior?
> >
> > Can the tools be built via Yocto?
> >
>
> Sure, you can. There have been various layers shared in the list before,
> check
> e.g. this thread:
>
>
> https://groups.google.com/d/msgid/jailhouse-dev/CABPcKDPEVAW0Y1x8ndpc6LQutq8cCsEKu20inFyFhrMRwa%2B--w%40mail.gmail.com?utm_medium=email&utm_source=footer
>
> Jan
>
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAOx%3DZ6G31%3DFjMiNSNj8derZiZw-mwEvx8TdRGyMcY630nkOV6A%40mail.gmail.com.

--000000000000e773360592471964
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif;font-size:small">Thanks, I found some other layers to work from =
(<a href=3D"https://github.com/henning-schild-work/meta-jailhouse" style=3D=
"font-family:Arial,Helvetica,sans-serif">https://github.com/henning-schild-=
work/meta-jailhouse</a>) also. I understand why I was getting the error now=
, working through it all. New to Jailhouse.</div><div class=3D"gmail_defaul=
t" style=3D"font-family:verdana,sans-serif;font-size:small">=C2=A0</div><di=
v><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signat=
ure"><div dir=3D"ltr">Best Regards<div>Peter</div></div></div></div><br></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Wed, 11 Sep 2019 at 13:42, Jan Kiszka &lt;<a href=3D"mailto:jan.kiszka@siem=
ens.com">jan.kiszka@siemens.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On 11.09.19 13:23, Peter Smith wrote:<br>
&gt; Apologize if this is a stupid question.<br>
&gt; <br>
&gt; I am trying to build jailhouse as part of a Yocto (thud) build for the=
 US+ <br>
&gt; MPSoC. I have based my recipe on one found in meta-ti/kernel/jailhouse=
 as it <br>
&gt; seemed to be the most up to date recipe I could find.<br>
&gt; <br>
&gt; The recipe builds using the following:<br>
&gt; <br>
&gt; EXTRA_OEMAKE =3D &quot;ARCH=3D${JH_ARCH} CROSS_COMPILE=3D${TARGET_PREF=
IX} <br>
&gt; KDIR=3D${STAGING_KERNEL_BUILDDIR}&quot;<br>
&gt; <br>
&gt; do_compile() {<br>
&gt; oe_runmake V=3D1<br>
&gt; }<br>
&gt; <br>
&gt; <br>
&gt; Everything proceeds well until the make process reaches the tools dire=
ctory <br>
&gt; where I get a compilation errors complaining about a missing &lt;stdio=
.h&gt; which Is <br>
&gt; rather odd I thought.<br>
&gt; <br>
&gt; <br>
&gt; | <br>
&gt; /build1/peter/PE2/ZCU/build/tmp/work/zcu102_zynqmp-poky-linux/jailhous=
e/0.11+gitAUTOINC+955a9418df-r0/git/tools/jailhouse-gcov-extract.c:13:10: <=
br>
&gt; fatal error: stdio.h: No such file or directory<br>
&gt; |=C2=A0 #include &lt;stdio.h&gt;<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~<br>
&gt; | compilation terminated.<br>
&gt; | <br>
&gt; /build1/peter/PE2/ZCU/build/tmp/work/zcu102_zynqmp-poky-linux/jailhous=
e/0.11+gitAUTOINC+955a9418df-r0/git/tools/jailhouse.c:14:10: <br>
&gt; fatal error: stdio.h: No such file or directory<br>
&gt; |=C2=A0 #include &lt;stdio.h&gt;<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~<br>
&gt; | compilation terminated.<br>
&gt; <br>
&gt; So my question is, is this expected behavior?<br>
&gt; <br>
&gt; Can the tools be built via Yocto?<br>
&gt; <br>
<br>
Sure, you can. There have been various layers shared in the list before, ch=
eck <br>
e.g. this thread:<br>
<br>
<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/CABPcKDPEVAW0Y1x=
8ndpc6LQutq8cCsEKu20inFyFhrMRwa%2B--w%40mail.gmail.com?utm_medium=3Demail&a=
mp;utm_source=3Dfooter" rel=3D"noreferrer" target=3D"_blank">https://groups=
.google.com/d/msgid/jailhouse-dev/CABPcKDPEVAW0Y1x8ndpc6LQutq8cCsEKu20inFyF=
hrMRwa%2B--w%40mail.gmail.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a=
><br>
<br>
Jan<br>
<br>
-- <br>
Siemens AG, Corporate Technology, CT RDA IOT SES-DE<br>
Corporate Competence Center Embedded Linux<br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAOx%3DZ6G31%3DFjMiNSNj8derZiZw-mwEvx8TdRGyMcY630n=
kOV6A%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://grou=
ps.google.com/d/msgid/jailhouse-dev/CAOx%3DZ6G31%3DFjMiNSNj8derZiZw-mwEvx8T=
dRGyMcY630nkOV6A%40mail.gmail.com</a>.<br />

--000000000000e773360592471964--
