Return-Path: <jailhouse-dev+bncBC4IPGFA6UFRBC6M333AKGQEMW55BEY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3c.google.com (mail-oo1-xc3c.google.com [IPv6:2607:f8b0:4864:20::c3c])
	by mail.lfdr.de (Postfix) with ESMTPS id A17EB1ED0CC
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Jun 2020 15:30:53 +0200 (CEST)
Received: by mail-oo1-xc3c.google.com with SMTP id u4sf1586177ood.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jun 2020 06:30:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591191052; cv=pass;
        d=google.com; s=arc-20160816;
        b=desJfsDSpvuhi5YXrhDwaM+nWVAuohjjOXC5Ew+80HQmdXhnKVbka6J4CEaMjwLcbn
         xmSSfF1WxKIGj7HVv/Brp8tc3Z3oaFS5JJBRdTpwXPEkjB/bip4Wi3RU3gbx9hzX8ZMl
         2kJEpeGo7U/G3Wt/4onq2vG7H7nTiYtMUmdB9DgY3qHldV10cuBcQ8hOBPfKqZ1n88Ze
         HNmdu3OT50VzMQVeNLT01EVBxHhH5q30wAMjjDnsUAig45Y9PKH8uPtLXu5Cn0cqYYYi
         Vh850G0FPDAgdD6aITSFGtjrFOn0GzseNSPuv9LMfsT2nlcNYqxZtRy2wrBeJuESRl7I
         u6IQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:feedback-id:message-id:date
         :content-transfer-encoding:mime-version:subject:to:from:sender
         :dkim-signature;
        bh=hoQGoShFsIGDd5yB6uWKHrJDYtJDKvOliLYiSRO7mmg=;
        b=lW2726I0/+3v33BzqjV2Fknjj3qt10vWWWim1Nic08+CQDnvstsC60mhiE9iWR3a6E
         jdhHSbSBOeMVL29kr/8VX/7WmNnFPPA9y+D5NrvnyPl1Xc5+7UUmeEe4UV9fToXGllcg
         kKTdZzb5VRxyPytLpuekcgOA2dmEn9JGo3O8IruKe5O+bqN3cuQlJV1ZuMGHazoS90Cw
         /9PapfdRtqn1VeN5hnOZGFnV7VD6n/0lgesK5bqiO42saE1eB+3Z5gJbqoBvAO2xFjaO
         zq7BBAobYyXrEf8cQBDZWV8rqSOou4nHP6ItzJcShclh8MJebTbiWleuK87C40lftiQC
         wOcw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@qq.com header.s=s201512 header.b=RXRvAEgr;
       spf=pass (google.com: domain of 497738387@qq.com designates 54.206.16.166 as permitted sender) smtp.mailfrom=497738387@qq.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:mime-version:content-transfer-encoding:date
         :message-id:feedback-id:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=hoQGoShFsIGDd5yB6uWKHrJDYtJDKvOliLYiSRO7mmg=;
        b=PmDGy8aBy0ZzbAXYozPrsyChbds/tqutJZ1bOBuDIepiIDEDhOPpe2HPh/p9ImKTlh
         c2kOM+ElNcsFQJ6bLy7w1fP8ZgzKLmBlu+QihyHzxVj1b0WTFMLufz2U+sK9icn2V+sS
         HFKU6YnVm0EWX/q9vfsnGZo+3tT0YuRkHtjoB2WaWXjLpl/GClL6ZfZM3ATXGiDJUJ7R
         pLQ8vxktbPZDaw3HN9XAEYW8jn9x2XQgNN/HngB03cjZZNSxpEQj6jiqDyT4d6xmEzb0
         LDAsnFEt5Jh78VXeSmt+5d0isJWxxbUNh63s/ozipKd0J5ZFlLY84zLbqwiFxBgOMFUv
         VS1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:mime-version
         :content-transfer-encoding:date:message-id:feedback-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=hoQGoShFsIGDd5yB6uWKHrJDYtJDKvOliLYiSRO7mmg=;
        b=SkZAu9rgDAOxYu6sBNTLXHQWQqWx4jz8Dj0dBIrrYWJZBLn36cKTv9tobbjNdAXjmt
         w8ds2zCsuVPGItcopYDUErRPFsD8IeApuP8f6CbhaboGLRjReDls27HZFk05GVatJWCW
         BDe5ieCVdApKK4WJV1QLF9o3uF8XhbejMdMLD3r10mlqABzzxB68VJYnuj3PSwAffx0Y
         9ll8lCMvDe21sJTrf66ip6knK+iZTfIsCInL+9OLOA6Liev2Txq3iB96PUIQwW6YKx3e
         3dqKXAuS+ACMIzk6CePa8rK2C38i9isqAPNCnLBEtz2j91OPNVLMxC/6XDdbywF6pV2X
         o0Kg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530sJJU/55FgBGnacyghkgmhMnMnDDye7qebDwpp0QsQMF8HsoGb
	AIsf4hhlqjPdBAH1Gw7SA7k=
X-Google-Smtp-Source: ABdhPJz1CqHO+lBzotarsDVNpZnfYaJx90UzE6v4CLffgtEvu8LJHY3kEjmye5D6kNQ1f4EbiZBmng==
X-Received: by 2002:aca:4cca:: with SMTP id z193mr5984091oia.46.1591191052008;
        Wed, 03 Jun 2020 06:30:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:86a:: with SMTP id 97ls420875oty.9.gmail; Wed, 03 Jun
 2020 06:30:51 -0700 (PDT)
X-Received: by 2002:a9d:5ad:: with SMTP id 42mr8786otd.268.1591191050289;
        Wed, 03 Jun 2020 06:30:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591191050; cv=none;
        d=google.com; s=arc-20160816;
        b=rsgYImX18l/+QXhtUqr8g2Y/lYKgsJct/T0GvZdrCY08K0n50ibueRwkqU6MWIttP6
         I4ZXx9es9o3vuozurLDAwjmRnipZQ+PB9RShXA47WZe7VVrGHmpP1SMuHQBmtjvdXwzY
         zlSvaMyh+i/KaW5orKFptDPfSfFfbBIgMNpp+Bj5rkRRZiCVX53/7WlW3Bmgpmj0yhOy
         CzEf9uyD9XZ7f5/u3jelZBybfB51uFStYN7R0S7sR/mCk9SsbRoZdeOuYCIV4lO81TFI
         L0jGHixW/hMLlFDltQKjKPeibyroQ5IHLay0y1MCFP7ov7ExD32HCUp1QHoY7ey/xUfK
         qbiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=feedback-id:message-id:date:content-transfer-encoding:mime-version
         :subject:to:from:dkim-signature;
        bh=0zx+LMsPMUVjfI6CVQjPyiuyRp1F5P3ulEt5bVea75s=;
        b=UTKC3XH3/rtqBTyKad5MtzjXmwRNuumbx3Uj/SpGMBAPw3NxFkQblC+iEVSh1Q8/jj
         BYtT4ILU0aIp4TEXvKdgzXCa5NR+CAkggbM72WD2c2xLE+/g9/xhyoNkyO/YewcfVS3t
         wtmYk2ubiS8mEdgA/RBJMBywpDt4ZOMY0ThmuweQKhcVsxbPCt9FvetlSvLDN26KVndg
         0woRgGJ0qReExAcpn0D13x9iLiveP30TQV6b8DL2Z6eba7zMFvGv1FfXHGpFT2aLEVrc
         Zt+gyTgXdHdADwGwQkkjO5nGcOARfJOL2dsJufHiR1jDeFp6RjrvlHygQgOkv4AR7AeA
         +/wQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@qq.com header.s=s201512 header.b=RXRvAEgr;
       spf=pass (google.com: domain of 497738387@qq.com designates 54.206.16.166 as permitted sender) smtp.mailfrom=497738387@qq.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=qq.com
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com. [54.206.16.166])
        by gmr-mx.google.com with ESMTPS id z6si99067oih.3.2020.06.03.06.30.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jun 2020 06:30:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of 497738387@qq.com designates 54.206.16.166 as permitted sender) client-ip=54.206.16.166;
X-QQ-FEAT: BMR7gkUTufj7LXp7DJPfSqOqWTLxAKLjmcEWL+OOjj3sOHB1vj891MDnUrsQc
	sbwWChq071IcteLEpxNR1o7QiHkjJiOa+LSA+8M6WFbGJ9PKZjszQ5QmCqb8rKUleqh2vNy
	QYGAxXENCOUwixRpjVu5OQURwVHmcgEQgPPBVA/fSnLUXONZV3ZLLeB6/9uw/psNI2dNwUq
	/zOE1hizeodSo98mMcoo3UyiX9yp39SFVfAe+R6FKaeWV5jx8HPQzW4PBGO57YIOje5N1t/
	T2X/dK2nzILXyW
X-QQ-SSF: 00000000000000F000000000000000T
X-QQ-XMAILINFO: OG5j+byDdTZhAluBxoLPagadbOMneEd6psefhMaMAJXWCqHA0axl1yNnviU5AF
	 m1Ln9NC4oYDxLMcaF/4oBpljTcAnQ683ckQangMl+xZ6T7tMNihxjHLY+PNaWB0tKFBzQPBDJ2g16
	 UCr7r1P24GnoRF8bF+BqkAklS7jUFdJPEgJXNIcNyAGqTP2JPEkBSj+31rYrNJApr3WSSkgpQ1h9y
	 SusItKJ0pdHneH6uveDfHBKMPSXrcVQxjU1H5Im4wfvVovDMfymAlxKjW12rjvmC4xT4ODeRGZx05
	 Yecf9fWAPBU4d8zH6Phw2CyHsViaGizWZQrVSpaBLDyBohq5FXDVwmRBuf7hn0eBXZzV72ler54ag
	 FZxNmz3s1GqiMYog50SoQu532AtrPW/TQuzJ0Qx83zbFlGI1p6av81fN6R1R8RASyBJ5oOGYBDec8
	 VOW6E7ZxWxXOLbN+LlFIPgn5Ea4CQ6poceNFnrtcy6Aysvm/K/O5chKUHpTuluSiY0bL/DygT8QYe
	 FUSIS8MRnWO6hXh/X1Ky/VjIthV7CO5RNRySznga92Haj6xon+L7V8eg0oP08ef62EqfxIvylDyIE
	 HQeZP+WlTeILYniDVhr6Htxplp7mHWPx0jK4wyk67OT3AKhS8LovpFSlDImBeY=
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 210.26.253.43
X-QQ-STYLE: 
X-QQ-mid: webmail721t1591191044t5155429
From: "=?ISO-8859-1?B?ZGQ=?=" <497738387@qq.com>
To: "=?ISO-8859-1?B?amFpbGhvdXNlLWRldg==?=" <jailhouse-dev@googlegroups.com>
Subject: question on Jailhouse-Images network
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_5ED7A603_0F977AF0_76544A68"
Content-Transfer-Encoding: 8Bit
Date: Wed, 3 Jun 2020 21:30:43 +0800
X-Priority: 3
Message-ID: <tencent_800F98F7CFF07895690D05760CB69748C805@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1])
	by smtp.qq.com (ESMTP) with SMTP
	id ; Wed, 03 Jun 2020 21:30:44 +0800 (CST)
Feedback-ID: webmail:qq.com:bgforeign:bgforeign12
X-QQ-Bgrelay: 1
X-Original-Sender: 497738387@qq.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@qq.com header.s=s201512 header.b=RXRvAEgr;       spf=pass
 (google.com: domain of 497738387@qq.com designates 54.206.16.166 as permitted
 sender) smtp.mailfrom=497738387@qq.com;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=qq.com
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

This is a multi-part message in MIME format.

------=_NextPart_5ED7A603_0F977AF0_76544A68
Content-Type: text/plain; charset="UTF-8"

Hello jan!
    I encountered network problems when I boot linux image built from jailhouse-images repository on my rpi4.
 I found there is no network on this system, i could not get a ipv4 address using&nbsp; eth0.
    and I haven't found a way to configure the network And i can't install tools.
 So I wrote this email to ask  if this is because the Linux kernel does not support related options.
   Is there a way to make the system network working?
   
   
 Thank  you very much.
                 
 lu.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/tencent_800F98F7CFF07895690D05760CB69748C805%40qq.com.

------=_NextPart_5ED7A603_0F977AF0_76544A68
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DGB18030">=
<div><span class=3D"tlid-translation translation" lang=3D"en"><span title=
=3D"" class=3D""><span class=3D"tlid-translation translation" lang=3D"en"><=
span title=3D"" class=3D""><span class=3D"tlid-translation translation" lan=
g=3D"en"><span title=3D"" class=3D""><span class=3D"tlid-translation transl=
ation" lang=3D"en"><span title=3D"" class=3D"">Hello jan!</span></span></sp=
an></span></span></span></span></span><br>
  <span class=3D"tlid-translation translation" lang=3D"en"><span title=3D""=
 class=3D""><span class=3D"tlid-translation translation" lang=3D"en"><span =
title=3D"" class=3D""><span class=3D"tlid-translation translation" lang=3D"=
en"><span title=3D"" class=3D""><span class=3D"tlid-translation translation=
" lang=3D"en"><span title=3D"" class=3D""><span class=3D"tlid-translation t=
ranslation" lang=3D"en"><span title=3D"" class=3D""> I encountered network =
problems when </span></span></span></span></span></span></span></span></spa=
n></span>I boot linux image built from jailhouse-images repository on my rp=
i4.</div>
<div><span class=3D"tlid-translation translation" lang=3D"en"><span title=
=3D"" class=3D"">I found there is no network on this system, i could not ge=
t a ipv4 address using&nbsp; eth0.<br>
</span></span>
  <div><span class=3D"tlid-translation translation" lang=3D"en"><span title=
=3D"" class=3D"">and I haven't found a way to configure the network
</span></span><span class=3D"tlid-translation translation" lang=3D"en"><spa=
n title=3D"" class=3D""><span class=3D"tlid-translation translation" lang=
=3D"en"><span title=3D"" class=3D"">And i can't install tools.</span></span=
></span></span><br>
<span class=3D"tlid-translation translation" lang=3D"en"><span title=3D"" c=
lass=3D""><span class=3D"tlid-translation translation" lang=3D"en"><span ti=
tle=3D"" class=3D""><span class=3D"tlid-translation translation" lang=3D"en=
"><span title=3D"" class=3D"">So I wrote this email to ask
 if this is because the Linux kernel does not support related options.</spa=
n></span></span></span></span></span></div>

  <div><span class=3D"tlid-translation translation" lang=3D"en"><span title=
=3D"" class=3D"">Is there a way to make the system</span></span><span class=
=3D"tlid-translation translation" lang=3D"en"><span title=3D"" class=3D""> =
network working?</span></span></div>
  <br>
  <span class=3D"tlid-translation translation" lang=3D"en"><span title=3D""=
 class=3D""><span class=3D"tlid-translation translation" lang=3D"en"><span =
title=3D"" class=3D""><span class=3D"tlid-translation translation" lang=3D"=
en"><span title=3D"" class=3D""><span class=3D"tlid-translation translation=
" lang=3D"en"><span title=3D"" class=3D""><span class=3D"tlid-translation t=
ranslation" lang=3D"en"><span title=3D"" class=3D""></span></span></span></=
span></span></span></span></span></span></span></div>
<div><span class=3D"tlid-translation translation" lang=3D"en"><span title=
=3D"" class=3D""><span class=3D"tlid-translation translation" lang=3D"en"><=
span title=3D"" class=3D""><span class=3D"tlid-translation translation" lan=
g=3D"en"><span title=3D"" class=3D""><span class=3D"tlid-translation transl=
ation" lang=3D"en"><span title=3D"" class=3D"">Thank
 you very much.<br>
                </span></span></span></span></span></span></span></span></d=
iv>

<span class=3D"tlid-translation translation" lang=3D"en"><span title=3D"" c=
lass=3D""><span class=3D"tlid-translation translation" lang=3D"en"><span ti=
tle=3D"" class=3D""><span class=3D"tlid-translation translation" lang=3D"en=
"><span title=3D"" class=3D""><span class=3D"tlid-translation translation" =
lang=3D"en"><span title=3D"" class=3D"">lu.</span></span></span></span></sp=
an></span></span></span>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/tencent_800F98F7CFF07895690D05760CB69748C805%40qq.=
com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msg=
id/jailhouse-dev/tencent_800F98F7CFF07895690D05760CB69748C805%40qq.com</a>.=
<br />

------=_NextPart_5ED7A603_0F977AF0_76544A68--



