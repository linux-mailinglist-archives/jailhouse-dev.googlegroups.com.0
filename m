Return-Path: <jailhouse-dev+bncBCJ2NIVKYUNBBYFQ7X6QKGQEMOEMBVQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf37.google.com (mail-qv1-xf37.google.com [IPv6:2607:f8b0:4864:20::f37])
	by mail.lfdr.de (Postfix) with ESMTPS id B865C2C4F4B
	for <lists+jailhouse-dev@lfdr.de>; Thu, 26 Nov 2020 08:25:21 +0100 (CET)
Received: by mail-qv1-xf37.google.com with SMTP id e11sf713097qvu.18
        for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Nov 2020 23:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4KYxybbjMvLEcGHwqpRGljT+bXhxuQsB41w8VqjuAvg=;
        b=Unm8IkMzpdz3zIWLbFqAsHuVRw4c6H/fhmqg788Cl7wB8l+uYxIiXnwwbVt0lUQX8d
         /j3CYAtxJHsOJjWG7aSQ0SgJfbXOVFLMsa0TZwuIL3E+AAuom6Qf9267DvduY7xC8c4W
         1xiAc/XcztS5kHspolsQF4F1ugcjTIodxBmj8JG9iEoASmeCUb6KiQ3sVEwLkDaAOwWY
         ezK2q+KN7OxJOou3yqPMTD/y7k6lA77dfDQj8P+0PzUgdlDd/g3ExrUO5UuOdxdsPmir
         jcKIF60JR9p+Pj5PeZOt92hZms3yRhEY/lXJkbRGla31SjVmAmVMNpNW5LmxPSyeTHUd
         tVzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4KYxybbjMvLEcGHwqpRGljT+bXhxuQsB41w8VqjuAvg=;
        b=bivI6Ind0q9q0ILgrnHmvgTr/LMIY/Av8pMbFmq0BKrKSLCjNck7QeRx3o4HaBPG+N
         cw4mKil61xnjZaO1yFE/diZzvjise9F84mbLvGmcfyqz6X+mM02UFBpe5U1fsJqOojyp
         BsUuMLG6OwPfe1M269TREZx/eyAzxuNa0Mw9u368Rt4yJNsamuLSrYMifFjVZONzdAbM
         m5/qF0vGPnYLiqjZLGo8eA73jWilzCCMDVzVlcer3/E93Kx03wmcLkPvgNoFHwO5guc5
         TaaWYTVuXthjmb8HGR+S1KtYD55NmynpAXgiAVFkN5PFSP1n3Sj9qtgc6ka4cS6vl+vJ
         9KyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=4KYxybbjMvLEcGHwqpRGljT+bXhxuQsB41w8VqjuAvg=;
        b=DdaU0kWcDIynjg3cMkrscx6+EgEcpmxpE4F5x8aD7fhFQ67lSrp4v2ePJj3OaFcVBd
         IL+8HO5Bt7qA2zJLPrhLHw93xYtfevDdotdP/98N2lcGgBl1lTpD7aUuVKWRXPP89cVl
         W4oAT2Oy6hDFqUePQxBgqn1NOpdfQNAYbLM3lLqwUXbauOHDwYe7BA7mn/ENgWCMniAX
         SPw6Ul28zB5C8r7CGxzfWOnecRnbQ3zZu5Xp6KnkvRpKC+5Dv7B6MQ0TOkPBHcv4qfE0
         Mt7oltpccI7GXR5NNmWCa2JUkjMTx/ERUMALlO895d6JrOB6n19003OiiGd7UoWavhSV
         wgoA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533VD8s0oFZkJTuMUF5u4hKSOQSDdndiMDzdCYZUWeTXXjHYomEf
	03UFzB/qvRmJ31h2o3Mj6Ww=
X-Google-Smtp-Source: ABdhPJwXBWzfs0zYVWNG2up1BJuT58DV4QDG5FicSIToziUiS/O8M9HtIDhSBYB723mHGVzlTp72wQ==
X-Received: by 2002:ac8:594:: with SMTP id a20mr1749967qth.98.1606375520272;
        Wed, 25 Nov 2020 23:25:20 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:7904:: with SMTP id u4ls660270qkc.7.gmail; Wed, 25 Nov
 2020 23:25:19 -0800 (PST)
X-Received: by 2002:a37:a396:: with SMTP id m144mr1942927qke.228.1606375519563;
        Wed, 25 Nov 2020 23:25:19 -0800 (PST)
Date: Wed, 25 Nov 2020 23:25:18 -0800 (PST)
From: Peter pan <peter.panjf@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <56f3d63c-03ec-49b1-ad5e-ffe4004a2e54n@googlegroups.com>
In-Reply-To: <93643562-d6ee-c66d-ac8d-180f98e5acd1@siemens.com>
References: <62ae1173-ee15-c179-8fcf-735527a96027@siemens.com>
 <93643562-d6ee-c66d-ac8d-180f98e5acd1@siemens.com>
Subject: Re: [linux-kernel][PATCH 2/2] ivshmem-net: Fix and rework carrier
 management
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2076_737799639.1606375518812"
X-Original-Sender: peter.panjf@gmail.com
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

------=_Part_2076_737799639.1606375518812
Content-Type: multipart/alternative; 
	boundary="----=_Part_2077_1803541617.1606375518812"

------=_Part_2077_1803541617.1606375518812
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jan,

I tested patches on the branch queues/jailhouse, it works for me.

Best Regards,
Jiafei.

=E5=9C=A82020=E5=B9=B411=E6=9C=8823=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=80 UTC=
+8 =E4=B8=8B=E5=8D=883:40:04<j.kiszka...@gmail.com> =E5=86=99=E9=81=93=EF=
=BC=9A

> On 23.11.20 08:37, Jan Kiszka wrote:
> > From: Jan Kiszka <jan.k...@siemens.com>
> >=20
> > The carrier of our virtual link is supposed to go on only when both
> > sides are in RUN state. So far, it only went on when one side entered
> > RUN by being int READY before and not when RUN was reached via
> > ivshm_net_open().
> >=20
> > Fix this by moving the carrier management into ivshm_net_run and
> > ivshm_net_do_stop, respectively. Make sure that netif_carrier_on is onl=
y
> > called when the peer in in RUN state already.
> >=20
> > Reported-by: Jiafei Pan <Jiafe...@nxp.com>
> > Signed-off-by: Jan Kiszka <jan.k...@siemens.com>
> > ---
> > drivers/net/ivshmem-net.c | 28 ++++++++++++++--------------
> > 1 file changed, 14 insertions(+), 14 deletions(-)
> >=20
> > diff --git a/drivers/net/ivshmem-net.c b/drivers/net/ivshmem-net.c
> > index 1b22b1cc5ea3..56c2c87e7498 100644
> > --- a/drivers/net/ivshmem-net.c
> > +++ b/drivers/net/ivshmem-net.c
> > @@ -549,6 +549,9 @@ static void ivshm_net_run(struct net_device *ndev)
> > if (!netif_running(ndev))
> > return;
> >=20
> > + if (in->last_peer_state =3D=3D IVSHM_NET_STATE_RUN)
> > + netif_carrier_on(ndev);
> > +
> > if (test_and_set_bit(IVSHM_NET_FLAG_RUN, &in->flags))
> > return;
> >=20
> > @@ -567,6 +570,7 @@ static void ivshm_net_do_stop(struct net_device=20
> *ndev)
> > if (!test_and_clear_bit(IVSHM_NET_FLAG_RUN, &in->flags))
> > return;
> >=20
> > + netif_carrier_off(ndev);
> > netif_stop_queue(ndev);
> > napi_disable(&in->napi);
> > }
> > @@ -616,22 +620,18 @@ static void ivshm_net_state_change(struct=20
> work_struct *work)
> > break;
> >=20
> > case IVSHM_NET_STATE_READY:
> > - /*
> > - * Link is up and we are running once the remote is in READY or
> > - * RUN.
> > - */
> > + case IVSHM_NET_STATE_RUN:
> > if (peer_state >=3D IVSHM_NET_STATE_READY) {
> > - netif_carrier_on(ndev);
> > + /*
> > + * Link is up and we are running once the remote is in
> > + * READY or RUN.
> > + */
> > ivshm_net_run(ndev);
> > - break;
> > - }
> > - /* fall through */
> > - case IVSHM_NET_STATE_RUN:
> > - /*
> > - * If the remote goes to RESET, we need to follow immediately.
> > - */
> > - if (peer_state =3D=3D IVSHM_NET_STATE_RESET) {
> > - netif_carrier_off(ndev);
> > + } else if (peer_state =3D=3D IVSHM_NET_STATE_RESET) {
> > + /*
> > + * If the remote goes to RESET, we need to follow
> > + * immediately.
> > + */
> > ivshm_net_do_stop(ndev);
> > }
> > break;
> >=20
>
> 5.10-rc5 queue was updated on
> http://git.kiszka.org/?p=3Dlinux.git;a=3Dshortlog;h=3Drefs/heads/queues/j=
ailhouse
> .
> Once you can confirm that this works for you, I will also update
> jailhouse/enabling queues with the two patches.
>
> Jan
>
> --=20
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/56f3d63c-03ec-49b1-ad5e-ffe4004a2e54n%40googlegroups.com.

------=_Part_2077_1803541617.1606375518812
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jan,<div><br></div><div>I tested patches on the branch queues/jailhouse=
, it works for me.</div><div><br></div><div>Best Regards,</div><div>Jiafei.=
<br><br></div><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_a=
ttr">=E5=9C=A82020=E5=B9=B411=E6=9C=8823=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=
=80 UTC+8 =E4=B8=8B=E5=8D=883:40:04&lt;j.kiszka...@gmail.com> =E5=86=99=E9=
=81=93=EF=BC=9A<br/></div><blockquote class=3D"gmail_quote" style=3D"margin=
: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex=
;">On 23.11.20 08:37, Jan Kiszka wrote:
<br>&gt; From: Jan Kiszka &lt;<a href data-email-masked rel=3D"nofollow">ja=
n.k...@siemens.com</a>&gt;
<br>&gt;=20
<br>&gt; The carrier of our virtual link is supposed to go on only when bot=
h
<br>&gt; sides are in RUN state. So far, it only went on when one side ente=
red
<br>&gt; RUN by being int READY before and not when RUN was reached via
<br>&gt; ivshm_net_open().
<br>&gt;=20
<br>&gt; Fix this by moving the carrier management into ivshm_net_run and
<br>&gt; ivshm_net_do_stop, respectively. Make sure that netif_carrier_on i=
s only
<br>&gt; called when the peer in in RUN state already.
<br>&gt;=20
<br>&gt; Reported-by: Jiafei Pan &lt;<a href data-email-masked rel=3D"nofol=
low">Jiafe...@nxp.com</a>&gt;
<br>&gt; Signed-off-by: Jan Kiszka &lt;<a href data-email-masked rel=3D"nof=
ollow">jan.k...@siemens.com</a>&gt;
<br>&gt; ---
<br>&gt;  drivers/net/ivshmem-net.c | 28 ++++++++++++++--------------
<br>&gt;  1 file changed, 14 insertions(+), 14 deletions(-)
<br>&gt;=20
<br>&gt; diff --git a/drivers/net/ivshmem-net.c b/drivers/net/ivshmem-net.c
<br>&gt; index 1b22b1cc5ea3..56c2c87e7498 100644
<br>&gt; --- a/drivers/net/ivshmem-net.c
<br>&gt; +++ b/drivers/net/ivshmem-net.c
<br>&gt; @@ -549,6 +549,9 @@ static void ivshm_net_run(struct net_device *n=
dev)
<br>&gt;  	if (!netif_running(ndev))
<br>&gt;  		return;
<br>&gt; =20
<br>&gt; +	if (in-&gt;last_peer_state =3D=3D IVSHM_NET_STATE_RUN)
<br>&gt; +		netif_carrier_on(ndev);
<br>&gt; +
<br>&gt;  	if (test_and_set_bit(IVSHM_NET_FLAG_RUN, &amp;in-&gt;flags))
<br>&gt;  		return;
<br>&gt; =20
<br>&gt; @@ -567,6 +570,7 @@ static void ivshm_net_do_stop(struct net_devic=
e *ndev)
<br>&gt;  	if (!test_and_clear_bit(IVSHM_NET_FLAG_RUN, &amp;in-&gt;flags))
<br>&gt;  		return;
<br>&gt; =20
<br>&gt; +	netif_carrier_off(ndev);
<br>&gt;  	netif_stop_queue(ndev);
<br>&gt;  	napi_disable(&amp;in-&gt;napi);
<br>&gt;  }
<br>&gt; @@ -616,22 +620,18 @@ static void ivshm_net_state_change(struct wo=
rk_struct *work)
<br>&gt;  		break;
<br>&gt; =20
<br>&gt;  	case IVSHM_NET_STATE_READY:
<br>&gt; -		/*
<br>&gt; -		 * Link is up and we are running once the remote is in READY or
<br>&gt; -		 * RUN.
<br>&gt; -		 */
<br>&gt; +	case IVSHM_NET_STATE_RUN:
<br>&gt;  		if (peer_state &gt;=3D IVSHM_NET_STATE_READY) {
<br>&gt; -			netif_carrier_on(ndev);
<br>&gt; +			/*
<br>&gt; +			 * Link is up and we are running once the remote is in
<br>&gt; +			 * READY or RUN.
<br>&gt; +			 */
<br>&gt;  			ivshm_net_run(ndev);
<br>&gt; -			break;
<br>&gt; -		}
<br>&gt; -		/* fall through */
<br>&gt; -	case IVSHM_NET_STATE_RUN:
<br>&gt; -		/*
<br>&gt; -		 * If the remote goes to RESET, we need to follow immediately.
<br>&gt; -		 */
<br>&gt; -		if (peer_state =3D=3D IVSHM_NET_STATE_RESET) {
<br>&gt; -			netif_carrier_off(ndev);
<br>&gt; +		} else if (peer_state =3D=3D IVSHM_NET_STATE_RESET) {
<br>&gt; +			/*
<br>&gt; +			 * If the remote goes to RESET, we need to follow
<br>&gt; +			 * immediately.
<br>&gt; +			 */
<br>&gt;  			ivshm_net_do_stop(ndev);
<br>&gt;  		}
<br>&gt;  		break;
<br>&gt;=20
<br>
<br>5.10-rc5 queue was updated on
<br><a href=3D"http://git.kiszka.org/?p=3Dlinux.git;a=3Dshortlog;h=3Drefs/h=
eads/queues/jailhouse" target=3D"_blank" rel=3D"nofollow" data-saferedirect=
url=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttp://git.kiszka.org/=
?p%3Dlinux.git;a%3Dshortlog;h%3Drefs/heads/queues/jailhouse&amp;source=3Dgm=
ail&amp;ust=3D1606363253599000&amp;usg=3DAFQjCNGtNPoCs9N0zY2Xi6jbggNHSC2KCA=
">http://git.kiszka.org/?p=3Dlinux.git;a=3Dshortlog;h=3Drefs/heads/queues/j=
ailhouse</a>.
<br>Once you can confirm that this works for you, I will also update
<br>jailhouse/enabling queues with the two patches.
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, T RDA IOT
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
om/d/msgid/jailhouse-dev/56f3d63c-03ec-49b1-ad5e-ffe4004a2e54n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/56f3d63c-03ec-49b1-ad5e-ffe4004a2e54n%40googlegroups.co=
m</a>.<br />

------=_Part_2077_1803541617.1606375518812--

------=_Part_2076_737799639.1606375518812--
