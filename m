Return-Path: <jailhouse-dev+bncBC7PTOEB2ALRB37K46CAMGQEGVGW6SQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf39.google.com (mail-qv1-xf39.google.com [IPv6:2607:f8b0:4864:20::f39])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAE9379D62
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 May 2021 05:09:36 +0200 (CEST)
Received: by mail-qv1-xf39.google.com with SMTP id y24-20020a0ca9180000b02901d367101f9dsf14313269qva.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 May 2021 20:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Njo4JFHJmA3d6Hr8eeN4aLuB8nBBa+epxaAp3H69vYY=;
        b=Ivpvq/Xt/kmg+1nhVk/4NJpnLz0Vcd+tqKj4RRmnP2UhZPsctv8C6ERnB1mipabKxn
         n03mGnjufcv8sy/jEHapOft82CK0ROyT3s1Sjbu9li4dD20Y0tJ9DVaiLRoDlws5Qkhs
         cp5buCTEtgmJZOOdI16rZVLryuEoDla41IRdWH8e2OAI9mh/90rNaK5C3wK9llW5xydw
         Wf48U6QIMQzf5i4MbYSJccf5zCmXIPvWVzrJM9crkUT4sCymQt4mfRG7VYTrWzQx5xOV
         CaSqWQJp7G8k9+1tWxpZ7K0ZBkH8WO+37LuR6pNM7P88a6b8I3XEhkhCyG+/bPaMb/1F
         inJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Njo4JFHJmA3d6Hr8eeN4aLuB8nBBa+epxaAp3H69vYY=;
        b=m2CX2IYU0aFq0mAJhBUQRdWI8SjYKMcODdhNoFRPDbSNAzPQ7jvyYWCHQZpneu2Qv1
         s/QiYv0mY205OpL5KOBBBNaz4QpgkIIFjeOov3/x8eAR1ouB3xaCNvdYi6RVqOnBzrCF
         b/TwF7RwtN9OG14NiIgardnTxyfJMnxBYA6DdT7Lm3/BRFBiCMZGxCBk7xGDX07iIBKK
         m8jyf4W6TPgH1dSN0/G9/54CnMXtcd/fhSdswIEZafSeA7Zbiuu7NxGn06gQZ0bf5hYP
         UFVdauqfYTBBMgLB+JahZPxN2V3QN32Nx+Ywf/R6NjMeX+o7HLJLj/RwB5qlccaUmK01
         3Iug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Njo4JFHJmA3d6Hr8eeN4aLuB8nBBa+epxaAp3H69vYY=;
        b=t1BDJSSO60IUiTE6NYUMuvz8KEG/xYId7DJ1j0zArulyyQnYwSqmgNTSDX9zsc0Eag
         wNvP+h8bO/mIKHW0dnbwGVmk6iMDLOSc8o6iKyYQ3chpbUbrOFU66lhZq9pOP9Ejvo9B
         W+PK4y8GYDIjDVTsOxzt+pONJWh4Zn1n90lYbSxXwEX1EmurNjTcNUoL6PayvUQbsL1W
         m0F1LM3qKHSdh0DuYEjpGYcKcWbVL5tkp4QrXKItSyyXNQ5FqrTyZtynyyDJyBuvx3De
         283fvFYFz2szfsdzcUsgTGS2Yiv2S3ZnJtb1ydxzq3K4hSggi++0HhoR9ytXE2lfbEmg
         u9cw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533rx9G230yvK4e1aV99DKYp1V6gT7IddD0470rWDguRunz/cQHu
	hPneEfgTb32K9NN4GoNQ8pE=
X-Google-Smtp-Source: ABdhPJzCrnwKFjIiL6AAo6xetPgM2qszLDcEA5Zt+FW/tzAeHUuf4UsO1M+Rfu4J47c2dGnm5xOZWA==
X-Received: by 2002:a05:620a:2093:: with SMTP id e19mr4215308qka.247.1620702575554;
        Mon, 10 May 2021 20:09:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:3d51:: with SMTP id u17ls7480559qtf.10.gmail; Mon, 10
 May 2021 20:09:34 -0700 (PDT)
X-Received: by 2002:a05:622a:1448:: with SMTP id v8mr11632835qtx.373.1620702574722;
        Mon, 10 May 2021 20:09:34 -0700 (PDT)
Date: Mon, 10 May 2021 20:09:34 -0700 (PDT)
From: along li <v6543210@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <9c0074e9-6aba-44dd-b0a3-619df4c196e4n@googlegroups.com>
In-Reply-To: <71b9b404.86dc.1795674be56.Coremail.caohp19@lzu.edu.cn>
References: <71b9b404.86dc.1795674be56.Coremail.caohp19@lzu.edu.cn>
Subject: Re: HELP about Jailhouse image
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3736_2095526510.1620702574111"
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

------=_Part_3736_2095526510.1620702574111
Content-Type: multipart/alternative; 
	boundary="----=_Part_3737_830392308.1620702574112"

------=_Part_3737_830392308.1620702574112
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

you need  scientific  network.   (acrocess  Great Firewall)

=E5=9C=A82021=E5=B9=B45=E6=9C=8810=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=80 UTC+=
8 =E4=B8=8B=E5=8D=889:26:07<=E6=9B=B9=E5=AE=8F=E9=B9=8F> =E5=86=99=E9=81=93=
=EF=BC=9A

> Dear sir:
>
> I use the jailhouse-image and choose the 11th option Raspberry Pi 4 (1-8=
=20
> GB editions).
> git clone https://github.com/siemens/jailhouse-images.git
> However there are some error information :
>
> ERROR: mc:rpi4-jailhouse-demo:linux-jailhouse-rpi-5.4.59-r0 do_fetch:=20
> Fetcher failure: Fetch command export PSEUDO_DISABLED=3D1; unset=20
> _PYTHON_SYSCONFIGDATA_NAME; export GIT_PROXY_COMMAND=3D"oe-git-proxy"; ex=
port=20
> NO_PROXY=3D"*"; export=20
> PATH=3D"/work/isar/scripts:/work/isar/bitbake/bin:/usr/sbin:/usr/bin:/sbi=
n:/bin";=20
> export HOME=3D"/tmp/tmp_61yteqn"; /usr/bin/env wget -t 2 -T 30 --passive-=
ftp=20
> --no-check-certificate -O=20
> /work/build/downloads/linux-108bab72978d4ec29ef6ac32506eb1783af599a2.tar.=
gz=20
> -P /work/build/downloads '
> https://github.com/siemens/linux/archive/108bab72978d4ec29ef6ac32506eb178=
3af599a2.tar.gz'=20
> --progress=3Ddot -v failed with exit code 4, output:
> --2021-05-10 13:12:51--=20
> https://github.com/siemens/linux/archive/108bab72978d4ec29ef6ac32506eb178=
3af599a2.tar.gz
> Resolving github.com (github.com)... 52.74.223.119
> Connecting to github.com (github.com)|52.74.223.119|:443... connected.
> HTTP request sent, awaiting response... Read error (Success.) in headers.
> Retrying.
>
> --2021-05-10 13:13:23-- (try: 2)=20
> https://github.com/siemens/linux/archive/108bab72978d4ec29ef6ac32506eb178=
3af599a2.tar.gz
> Connecting to github.com (github.com)|52.74.223.119|:443... failed:=20
> Connection timed out.
> Resolving github.com (github.com)... 52.74.223.119
> Connecting to github.com (github.com)|52.74.223.119|:443... failed:=20
> Connection timed out.
> Giving up.
>
>
> ERROR: mc:rpi4-jailhouse-demo:linux-jailhouse-rpi-5.4.59-r0 do_fetch:=20
> Fetcher failure for URL: '
> https://github.com/siemens/linux/archive/108bab72978d4ec29ef6ac32506eb178=
3af599a2.tar.gz;downloadfilename=3Dlinux-108bab72978d4ec29ef6ac32506eb1783a=
f599a2.tar.gz'.=20
> Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in:=20
> /work/build/tmp/work/jailhouse-demo-arm64/linux-jailhouse-rpi/5.4.59-r0/t=
emp/log.do_fetch.253
> ERROR: Task=20
> (mc:rpi4-jailhouse-demo:/repo/recipes-kernel/linux/linux-jailhouse-rpi_5.=
4.59.bb:do_fetch)=20
> failed with exit code '1'
>
> so whether someone meet this problem, thanks for your generous help.
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/9c0074e9-6aba-44dd-b0a3-619df4c196e4n%40googlegroups.com.

------=_Part_3737_830392308.1620702574112
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

you need&nbsp; scientific&nbsp; network.&nbsp; &nbsp;(acrocess&nbsp; Great =
Firewall)<div><br></div><div class=3D"gmail_quote"><div dir=3D"auto" class=
=3D"gmail_attr">=E5=9C=A82021=E5=B9=B45=E6=9C=8810=E6=97=A5=E6=98=9F=E6=9C=
=9F=E4=B8=80 UTC+8 =E4=B8=8B=E5=8D=889:26:07&lt;=E6=9B=B9=E5=AE=8F=E9=B9=8F=
> =E5=86=99=E9=81=93=EF=BC=9A<br/></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); pad=
ding-left: 1ex;">Dear sir:<p>I use the jailhouse-image and choose the 11th =
option Raspberry Pi 4 (1-8 GB editions).<br>git clone <a href=3D"https://gi=
thub.com/siemens/jailhouse-images.git" target=3D"_blank" rel=3D"nofollow" d=
ata-saferedirecturl=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps:=
//github.com/siemens/jailhouse-images.git&amp;source=3Dgmail&amp;ust=3D1620=
788680125000&amp;usg=3DAFQjCNFIUCCeeFTufhRpnxcSxI53XhPV9g">https://github.c=
om/siemens/jailhouse-images.git</a><br>However there are some error informa=
tion :<p>ERROR: mc:rpi4-jailhouse-demo:linux-jailhouse-rpi-5.4.59-r0 do_fet=
ch: Fetcher failure: Fetch command export PSEUDO_DISABLED=3D1; unset _PYTHO=
N_SYSCONFIGDATA_NAME; export GIT_PROXY_COMMAND=3D&quot;oe-git-proxy&quot;; =
export NO_PROXY=3D&quot;*&quot;; export PATH=3D&quot;/work/isar/scripts:/wo=
rk/isar/bitbake/bin:/usr/sbin:/usr/bin:/sbin:/bin&quot;; export HOME=3D&quo=
t;/tmp/tmp_61yteqn&quot;; /usr/bin/env wget -t 2 -T 30 --passive-ftp --no-c=
heck-certificate -O /work/build/downloads/linux-108bab72978d4ec29ef6ac32506=
eb1783af599a2.tar.gz -P /work/build/downloads &#39;<a href=3D"https://githu=
b.com/siemens/linux/archive/108bab72978d4ec29ef6ac32506eb1783af599a2.tar.gz=
" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.go=
ogle.com/url?hl=3Dzh-CN&amp;q=3Dhttps://github.com/siemens/linux/archive/10=
8bab72978d4ec29ef6ac32506eb1783af599a2.tar.gz&amp;source=3Dgmail&amp;ust=3D=
1620788680125000&amp;usg=3DAFQjCNEPUvi675qsKwNylV6Dw4W_1ugqRQ">https://gith=
ub.com/siemens/linux/archive/108bab72978d4ec29ef6ac32506eb1783af599a2.tar.g=
z</a>&#39; --progress=3Ddot -v failed with exit code 4, output:<br>--2021-0=
5-10 13:12:51--  <a href=3D"https://github.com/siemens/linux/archive/108bab=
72978d4ec29ef6ac32506eb1783af599a2.tar.gz" target=3D"_blank" rel=3D"nofollo=
w" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dht=
tps://github.com/siemens/linux/archive/108bab72978d4ec29ef6ac32506eb1783af5=
99a2.tar.gz&amp;source=3Dgmail&amp;ust=3D1620788680125000&amp;usg=3DAFQjCNE=
PUvi675qsKwNylV6Dw4W_1ugqRQ">https://github.com/siemens/linux/archive/108ba=
b72978d4ec29ef6ac32506eb1783af599a2.tar.gz</a><br>Resolving <a href=3D"http=
://github.com" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"h=
ttps://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttp://github.com&amp;source=
=3Dgmail&amp;ust=3D1620788680125000&amp;usg=3DAFQjCNFYXUQrB5Jl9MH8Gj2oXWdIj=
zDrdA">github.com</a> (<a href=3D"http://github.com" target=3D"_blank" rel=
=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dzh-CN=
&amp;q=3Dhttp://github.com&amp;source=3Dgmail&amp;ust=3D1620788680125000&am=
p;usg=3DAFQjCNFYXUQrB5Jl9MH8Gj2oXWdIjzDrdA">github.com</a>)... 52.74.223.11=
9<br>Connecting to <a href=3D"http://github.com" target=3D"_blank" rel=3D"n=
ofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dzh-CN&amp;=
q=3Dhttp://github.com&amp;source=3Dgmail&amp;ust=3D1620788680125000&amp;usg=
=3DAFQjCNFYXUQrB5Jl9MH8Gj2oXWdIjzDrdA">github.com</a> (<a href=3D"http://gi=
thub.com" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https:=
//www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttp://github.com&amp;source=3Dgmai=
l&amp;ust=3D1620788680125000&amp;usg=3DAFQjCNFYXUQrB5Jl9MH8Gj2oXWdIjzDrdA">=
github.com</a>)|52.74.223.119|:443... connected.<br>HTTP request sent, awai=
ting response... Read error (Success.) in headers.<br>Retrying.<p>--2021-05=
-10 13:13:23--  (try: 2)  <a href=3D"https://github.com/siemens/linux/archi=
ve/108bab72978d4ec29ef6ac32506eb1783af599a2.tar.gz" target=3D"_blank" rel=
=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dzh-CN=
&amp;q=3Dhttps://github.com/siemens/linux/archive/108bab72978d4ec29ef6ac325=
06eb1783af599a2.tar.gz&amp;source=3Dgmail&amp;ust=3D1620788680125000&amp;us=
g=3DAFQjCNEPUvi675qsKwNylV6Dw4W_1ugqRQ">https://github.com/siemens/linux/ar=
chive/108bab72978d4ec29ef6ac32506eb1783af599a2.tar.gz</a><br>Connecting to =
<a href=3D"http://github.com" target=3D"_blank" rel=3D"nofollow" data-safer=
edirecturl=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttp://github.c=
om&amp;source=3Dgmail&amp;ust=3D1620788680125000&amp;usg=3DAFQjCNFYXUQrB5Jl=
9MH8Gj2oXWdIjzDrdA">github.com</a> (<a href=3D"http://github.com" target=3D=
"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/ur=
l?hl=3Dzh-CN&amp;q=3Dhttp://github.com&amp;source=3Dgmail&amp;ust=3D1620788=
680125000&amp;usg=3DAFQjCNFYXUQrB5Jl9MH8Gj2oXWdIjzDrdA">github.com</a>)|52.=
74.223.119|:443... failed: Connection timed out.<br>Resolving <a href=3D"ht=
tp://github.com" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D=
"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttp://github.com&amp;source=
=3Dgmail&amp;ust=3D1620788680125000&amp;usg=3DAFQjCNFYXUQrB5Jl9MH8Gj2oXWdIj=
zDrdA">github.com</a> (<a href=3D"http://github.com" target=3D"_blank" rel=
=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dzh-CN=
&amp;q=3Dhttp://github.com&amp;source=3Dgmail&amp;ust=3D1620788680125000&am=
p;usg=3DAFQjCNFYXUQrB5Jl9MH8Gj2oXWdIjzDrdA">github.com</a>)... 52.74.223.11=
9<br>Connecting to <a href=3D"http://github.com" target=3D"_blank" rel=3D"n=
ofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dzh-CN&amp;=
q=3Dhttp://github.com&amp;source=3Dgmail&amp;ust=3D1620788680125000&amp;usg=
=3DAFQjCNFYXUQrB5Jl9MH8Gj2oXWdIjzDrdA">github.com</a> (<a href=3D"http://gi=
thub.com" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https:=
//www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttp://github.com&amp;source=3Dgmai=
l&amp;ust=3D1620788680125000&amp;usg=3DAFQjCNFYXUQrB5Jl9MH8Gj2oXWdIjzDrdA">=
github.com</a>)|52.74.223.119|:443... failed: Connection timed out.<br>Givi=
ng up.<p><br>ERROR: mc:rpi4-jailhouse-demo:linux-jailhouse-rpi-5.4.59-r0 do=
_fetch: Fetcher failure for URL: &#39;<a href=3D"https://github.com/siemens=
/linux/archive/108bab72978d4ec29ef6ac32506eb1783af599a2.tar.gz;downloadfile=
name=3Dlinux-108bab72978d4ec29ef6ac32506eb1783af599a2.tar.gz" target=3D"_bl=
ank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=
=3Dzh-CN&amp;q=3Dhttps://github.com/siemens/linux/archive/108bab72978d4ec29=
ef6ac32506eb1783af599a2.tar.gz;downloadfilename%3Dlinux-108bab72978d4ec29ef=
6ac32506eb1783af599a2.tar.gz&amp;source=3Dgmail&amp;ust=3D1620788680125000&=
amp;usg=3DAFQjCNGaM81WWQsXZQeZznI1SEU-lI6Q5A">https://github.com/siemens/li=
nux/archive/108bab72978d4ec29ef6ac32506eb1783af599a2.tar.gz;downloadfilenam=
e=3Dlinux-108bab72978d4ec29ef6ac32506eb1783af599a2.tar.gz</a>&#39;. Unable =
to fetch URL from any source.<br>ERROR: Logfile of failure stored in: /work=
/build/tmp/work/jailhouse-demo-arm64/linux-jailhouse-rpi/5.4.59-r0/temp/log=
.do_fetch.253<br>ERROR: Task (mc:rpi4-jailhouse-demo:/repo/recipes-kernel/l=
inux/linux-jailhouse-rpi_5.4.59.bb:do_fetch) failed with exit code &#39;1&#=
39;<p>so whether someone meet this problem, thanks for your generous help.<=
p></p></p></p></p></p></p></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/9c0074e9-6aba-44dd-b0a3-619df4c196e4n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/9c0074e9-6aba-44dd-b0a3-619df4c196e4n%40googlegroups.co=
m</a>.<br />

------=_Part_3737_830392308.1620702574112--

------=_Part_3736_2095526510.1620702574111--
