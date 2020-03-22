Return-Path: <jailhouse-dev+bncBDSMF24UTUGRBFUS33ZQKGQEUVNTDUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x239.google.com (mail-oi1-x239.google.com [IPv6:2607:f8b0:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 2766F18E9E3
	for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Mar 2020 16:49:45 +0100 (CET)
Received: by mail-oi1-x239.google.com with SMTP id p2sf8391316oic.7
        for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Mar 2020 08:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Vmnwes0Gy3xn+BBgVrgDrOSKtD8MdTxDYiT+LnhbGvU=;
        b=eQB487FFhFxWfPlqIdKb2PQfD7kz8NyB2pPhnUR5n8YUB0M/3/C4Xs2veqfb2y24lX
         kH3K3VFORkr4vV06hDmllpzNa7rUMZ/Uzsp1SpnsLaPYVpKDo6YDpAjL9kXQcg9L8WBX
         4g7i1j+pxyHywcuCTTsk2h7DOmoCBPgnrGOrIVpI73DypMafB4R7yXuioqZh2qCk5hhq
         /DCCVj2+2lqTIypd8Pp3R4Brp0sK0jBBegLe+DntvisdXSXVxFmzWpZqsBO+OVau8U5W
         I+DDeBF9kUGdUU8RRrZlnai6sRuK8jaUND5liYkICWQgk4RZ3hg13n94e2amlQ7oiYzx
         nmew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Vmnwes0Gy3xn+BBgVrgDrOSKtD8MdTxDYiT+LnhbGvU=;
        b=X89eZyINMWCTvmQersmKYJdqyUL+AqMzo/2swKCldx3GBH3pDCJQTNbpYKTMpRz8ug
         DlXiRgU53xPEj8IWy2vji1Wjlhhnr8hQ4EEC/qtOKZpmFmKTu2PZp6B1mgi12/ru3DbB
         kaNnZzkjJx44oQBC4o/mNJCPsfue1dxjcR+HV2BWRfTVE76iFRfKa7Z9ytN9eURw7MXx
         FHr5BANJNeANzjo04RNML/psugKV4OuURe4LrZxk3MnxzjECtWZjld5YlBtda5gicfjJ
         P9ezvuksJTBeDHYA3fObeHbM8uBx3UgItLyn3/dqwnYDhunhwATWDKeH7sBavKlu/ehN
         BDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Vmnwes0Gy3xn+BBgVrgDrOSKtD8MdTxDYiT+LnhbGvU=;
        b=iCUE9x7P7TzABkwhKiA2G3L2QZSqhl/4EUb2wmdEdqOIyHTVS9txRI2CGC713gpKWZ
         73uK8j8dOY7mdMXlWMEehoGppWaZnutzofAb+sEBw0+a+n/sMvHYIdj/n+nUlmh8qLvx
         59CKbG84g9EJxEEkGAcXLE05SVS0Nyteb1jtFryg6gw2IJGm0FVbTmA8AKMI/g/7YnVy
         jdn2sCk4mULzWIgV1hyJ/nGU8ka3at7nJ83TU1AGB88x/0ZBXCk8fFaccgKErO16MKSG
         Ph5IWHhWfeI+SJ5Za1Rc9ChTHCdInYYvKtR0ACgkI3cQMa9q1EaTE5Qtu851K1W49QRb
         TKIw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ3mLAG2KYOe9DvwlleO5B4ROkitqekquzzn7oxKFf6ZxIPojB1k
	WITuRj773kyna901ntbZLlQ=
X-Google-Smtp-Source: ADFU+vsMAH6N20aYMJo/AJ2kb6w58dM38bDOJVzPaKrXyTEQyI9Msovdr8d7Q+DmmtpXRnDK9hqaGQ==
X-Received: by 2002:aca:eb4e:: with SMTP id j75mr14453942oih.18.1584892183675;
        Sun, 22 Mar 2020 08:49:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:508d:: with SMTP id e135ls4712627oib.5.gmail; Sun, 22
 Mar 2020 08:49:42 -0700 (PDT)
X-Received: by 2002:aca:df06:: with SMTP id w6mr14264657oig.2.1584892182343;
        Sun, 22 Mar 2020 08:49:42 -0700 (PDT)
Date: Sun, 22 Mar 2020 08:49:41 -0700 (PDT)
From: Parth Dode <dodecoder@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <ef02c924-2656-439a-93f9-5c80893be762@googlegroups.com>
In-Reply-To: <0015c8f5-16c7-e43f-f0e4-f163dcd3d1a0@siemens.com>
References: <36eac3b7-b6bc-4774-826d-9942dae992d1@googlegroups.com>
 <e680e1f1-e368-5d84-8283-47ef95e3ad80@siemens.com>
 <0a8c17d5-087a-484d-b972-ae286795aafe@googlegroups.com>
 <46d73528-b64b-9310-4a94-bab84dc7ace8@siemens.com>
 <0968c391-e1f3-4edd-bd10-9bc8665b11d0@googlegroups.com>
 <0015c8f5-16c7-e43f-f0e4-f163dcd3d1a0@siemens.com>
Subject: Re:
 mc:rpi4-jailhouse-demo:/repo/recipes-core/non-root-initramfs/non-root-initramfs_2019.11.1.bb:do_dpkg_build
 Summary: There was 1 ERROR message shown, returning a non-zero exit code.
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_948_55017734.1584892181658"
X-Original-Sender: dodecoder@gmail.com
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

------=_Part_948_55017734.1584892181658
Content-Type: multipart/alternative; 
	boundary="----=_Part_949_50474524.1584892181658"

------=_Part_949_50474524.1584892181658
Content-Type: text/plain; charset="UTF-8"



On Friday, March 20, 2020 at 11:22:41 AM UTC+5:30, Jan Kiszka wrote:
>
> On 19.03.20 23:02, Parth Dode wrote: 
> > Yes , you're right. Why is it necessary tho to not be root when building 
> it? 
> > 
>
> The user you call "build-images.sh" with is propagated into build 
> container. There, one build step of the non-root-initramfs that we 
> import via buildroot performs safety check that it is not root (because 
> it need not be and it might be a security-wise better to avoid that). I 
> recall we also stumbled over that while our Kubernetes CI runners where 
> still using root as user. 
>
> I'll post a patch that turns this check off, it's not really needed here. 
>
> Jan 
>
> -- 
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE 
> Corporate Competence Center Embedded Linux 
>

Oh okay , I understand . I also tried to understand from youtube.
Thank you for replying so soon.  

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ef02c924-2656-439a-93f9-5c80893be762%40googlegroups.com.

------=_Part_949_50474524.1584892181658
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Friday, March 20, 2020 at 11:22:41 AM UTC+5:30,=
 Jan Kiszka wrote:<blockquote class=3D"gmail_quote" style=3D"margin: 0px 0p=
x 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex; =
--darkreader-inline-border-left:#3a3a3a;" data-darkreader-inline-border-lef=
t=3D"">On 19.03.20 23:02, Parth Dode wrote:
<br>&gt; Yes , you&#39;re right. Why is it necessary tho to not be root whe=
n building it?
<br>&gt;=20
<br>
<br>The user you call &quot;build-images.sh&quot; with is propagated into b=
uild=20
<br>container. There, one build step of the non-root-initramfs that we=20
<br>import via buildroot performs safety check that it is not root (because=
=20
<br>it need not be and it might be a security-wise better to avoid that). I=
=20
<br>recall we also stumbled over that while our Kubernetes CI runners where=
=20
<br>still using root as user.
<br>
<br>I&#39;ll post a patch that turns this check off, it&#39;s not really ne=
eded here.
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, Corporate Technology, CT RDA IOT SES-DE
<br>Corporate Competence Center Embedded Linux
<br></blockquote><div><br></div><div>Oh okay , I understand . I also tried =
to understand from youtube.</div><div>Thank you for replying so soon.=C2=A0=
=C2=A0<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/ef02c924-2656-439a-93f9-5c80893be762%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/ef02c924-2656-439a-93f9-5c80893be762%40googlegroups.com<=
/a>.<br />

------=_Part_949_50474524.1584892181658--

------=_Part_948_55017734.1584892181658--
