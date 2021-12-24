Return-Path: <jailhouse-dev+bncBC653PXTYYERB2P6SWHAMGQEDOQWJGA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf40.google.com (mail-qv1-xf40.google.com [IPv6:2607:f8b0:4864:20::f40])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB9B47ECF6
	for <lists+jailhouse-dev@lfdr.de>; Fri, 24 Dec 2021 09:06:02 +0100 (CET)
Received: by mail-qv1-xf40.google.com with SMTP id fn12-20020ad45d6c000000b003bd9c921c0esf6223382qvb.21
        for <lists+jailhouse-dev@lfdr.de>; Fri, 24 Dec 2021 00:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=VuXxkOEkrflMYOzeEgjoAP1mCvZ3/27m3Bj61vNahto=;
        b=KCJGoH5RG7WU+yRskVbzy9uH7WcYgDSPY6BvLREN0LSlTXTXn6ydXZbb/l7qGmYewo
         D8mNwQUu7+YnSs2zALr3aIr22DhEOfMXDC7DSX8zINnX/ObloClcU8cdFUY7z9Po+GRu
         u3FnmOemshu4Mha3JGRQAreA085f7axVYr9RRMew8+7z+4C4GHyim3wKvel6I0cCi1tW
         d0BSlpVCuOnOPEAhAjUybpAEw4Teo2XsAgvnNI/3/H2jkBQMOp1UbCVjw6unHh/dNRJp
         qwqmUHslAfW+hgUgkdvrP7KQ+aj6nINQ8YszVrTnImQhrBhGo+mVITPJETbPSdijnGPJ
         F3iQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=VuXxkOEkrflMYOzeEgjoAP1mCvZ3/27m3Bj61vNahto=;
        b=fAhKWM+CbPGX0n9bonDxdMTkYFdwTHKTS7DzpDujydSj3spEdUbdPbglHLzom8S05D
         +44rICQZHAsnWJYqecRF7CTM74bSWu8qCw/s6r7uoP2mc2+yUlJfKFc99hvOPwPdayXC
         +x4M2ZxHdwrgNvYX7SIz5+qBzuwKYVhxrjs3WkpByiurH1d1N2F60nHJ3ClPSg/sn10+
         RWZlDDqpfPlFGe9Xtj+vjXCbvmUih80pV48m8x+stlp5ZOf3pNZD4P0hX3H78FuRFwO+
         gIl8I94wGPocfWbln17h4jXj2dGwT/0e/hTehG2awOj9bkYsU9/YMQhyVhmBwQlmZZ3l
         gg5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=VuXxkOEkrflMYOzeEgjoAP1mCvZ3/27m3Bj61vNahto=;
        b=lzwqU2NgOAiV44HjLNXNe0KHmQetjD+goTUTOulRIyejnVW5eqHVR2CwqQTNwrZxTp
         jNgFfX+41YvJHYYDsjocCNLUGurb+vcn/aAGx+ONY58AaYm77oSab8kY6gLNG/BeLS4b
         PEqEJj/BIsuSYpvucYYmbwFjZMFI0VORQYM/7NPsGB596r931K/sejezfJ/Pllld6MZM
         7K4hIOjuKyAg0gUIbBDVGYr71YPvcNrNHJEiBlntTh7SCcB60feRAeGIL7vqEWel5HpK
         GFdjsxYFHP4dKtdhbZChUdPCihlhstDTT+OOZP5SVWOz0SnLrARK9Y4Wr64srgXIa8vU
         /jtQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530zooQ9OOqPZvLfvkyyaGf1Whh2L8dR4jdd/Wl07PMLT3iSRndU
	VjPQCxbVRTm0sLm9ReQ6+kc=
X-Google-Smtp-Source: ABdhPJxrNgxjclio8KMbuqYkDhIkGqmALDpnL0UqS8rwJVG9mtwhqasiXeh4N4jf8maiWXoo+pmsCg==
X-Received: by 2002:a37:5541:: with SMTP id j62mr3875512qkb.180.1640333161888;
        Fri, 24 Dec 2021 00:06:01 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:5bc7:: with SMTP id b7ls2146047qtb.11.gmail; Fri, 24 Dec
 2021 00:06:01 -0800 (PST)
X-Received: by 2002:ac8:7e88:: with SMTP id w8mr4675324qtj.357.1640333161221;
        Fri, 24 Dec 2021 00:06:01 -0800 (PST)
Date: Fri, 24 Dec 2021 00:06:00 -0800 (PST)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <3654fe21-ba05-4845-b7de-b7eb2c59155bn@googlegroups.com>
In-Reply-To: <b05b3ac9-dec3-40d5-a754-f9b75507e1edn@googlegroups.com>
References: <b05b3ac9-dec3-40d5-a754-f9b75507e1edn@googlegroups.com>
Subject: Re: eth0 on RPi4 jailhouse-image
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_6930_2108056652.1640333160757"
X-Original-Sender: mustafa13e09940@gmail.com
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

------=_Part_6930_2108056652.1640333160757
Content-Type: multipart/alternative; 
	boundary="----=_Part_6931_1838178014.1640333160757"

------=_Part_6931_1838178014.1640333160757
Content-Type: text/plain; charset="UTF-8"

Not needed anymore, I was able to reproduce steps to port jailhouse into 
RPi4. Mainly, the problem is always missing kernel flags, but I would 
recommend anyone to see the defconfig of jailhouse-image and see what is 
missing. 

Moustafa

On Saturday, 18 December 2021 at 14:16:46 UTC+1 Moustafa Nofal wrote:

> Hi, 
> How to release the physical NIC from jailhouse? I mean I need the ethernet 
> interface to connect to a network, and I would replace it with a virtual 
> ethernet. The setup used is the image produced by jailhouse-image for 
> raspberry pi4. 
> Best regards,
> Moustafa Noufale
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3654fe21-ba05-4845-b7de-b7eb2c59155bn%40googlegroups.com.

------=_Part_6931_1838178014.1640333160757
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Not needed anymore, I was able to reproduce steps to port jailhouse into RP=
i4. Mainly, the problem is always missing kernel flags, but I would recomme=
nd anyone to see the defconfig of jailhouse-image and see what is missing.&=
nbsp;<br><br>Moustafa<br><br><div class=3D"gmail_quote"><div dir=3D"auto" c=
lass=3D"gmail_attr">On Saturday, 18 December 2021 at 14:16:46 UTC+1 Moustaf=
a Nofal wrote:<br/></div><blockquote class=3D"gmail_quote" style=3D"margin:=
 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;=
">Hi, <br><div>How to release the physical NIC from jailhouse? I mean I nee=
d the ethernet interface to connect to a network, and I would replace it wi=
th a virtual ethernet. The setup used is the image produced by jailhouse-im=
age for raspberry pi4. <br></div><div>Best regards,</div><div>Moustafa Nouf=
ale<br></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/3654fe21-ba05-4845-b7de-b7eb2c59155bn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/3654fe21-ba05-4845-b7de-b7eb2c59155bn%40googlegroups.co=
m</a>.<br />

------=_Part_6931_1838178014.1640333160757--

------=_Part_6930_2108056652.1640333160757--
