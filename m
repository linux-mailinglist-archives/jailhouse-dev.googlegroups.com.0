Return-Path: <jailhouse-dev+bncBCWYH5WD24EBB2WPZ7TAKGQE53RYFZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F6C186E5
	for <lists+jailhouse-dev@lfdr.de>; Thu,  9 May 2019 10:42:18 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id b16sf332439ljj.5
        for <lists+jailhouse-dev@lfdr.de>; Thu, 09 May 2019 01:42:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557391338; cv=pass;
        d=google.com; s=arc-20160816;
        b=MPRXT2LzgkEPWsiGYysXlmcy+RlOn5lrKPPQgCU5Ypq66YUXejD+6tTAPqImFAc9cd
         WxGXtYZAPjwkIyJq70QWxOZ0T+Cj0yMVLOLUVUJJpKrokgY1+J3gtHoOiaSozOIubrUD
         Ljs9jhY9u2Bj6cRCfMBNhCP3frIh2N+y5bdL09FgO1hCAY0qZM6HDtJIXXQbqlGvLzj6
         NX3NdBqEohTBB/OTDunWAPj8tYdMwmiKgFqBZ0qR25AvmaXXCdfULtFbtaY/eQ3G/AFP
         entNZMHXdftk13VfVsV5A2IO+fqQKYHMiXH8x5G+NNNyYOmzTtLwEZjvmyVlpxSROzdc
         6bsA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=7+/zd45X78a+IOCS/VOJqYgJvX2WBxlt8LLZPp6Ukjo=;
        b=lv6YjRuEMaCqXx442L2C1FUab40oitlHGKRaL6UQxm+qBafbcqS4k8NL0cvgt/edqn
         BClG1ae4nmTpsjZsakihEHVr6JcCD+ANXd+HzxhqyVCf3Q0y63odfSsuZc88YvXr8oFO
         xjFiX/wHtMkeRQggLjn8SIpsB/Q4R/ym1hQxDvaS3IjITa2omW5NjjZOV/3PI2k8rlSq
         KPuHMyDZj7rqNNxQt5JaViYwfqZ2r9cBXYW5tItouQdlKKRUhyR8B/FHHDxgvi/wIKJQ
         UInSvYg5K9uZjt9aNTzLzD6hjXDP6lNpGMOs9CJ0z6KrbSBkyxeLOn+xnRim4sOotx3X
         lk7w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=nHkCJZVw;
       spf=pass (google.com: domain of jan.hoogerbrugge@gmail.com designates 2a00:1450:4864:20::42f as permitted sender) smtp.mailfrom=jan.hoogerbrugge@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7+/zd45X78a+IOCS/VOJqYgJvX2WBxlt8LLZPp6Ukjo=;
        b=iLWpgv1eufHMesZJN0j1MO5OYLSC1qmLVEtNKhh6NqBp9oSFdH3nt11YwVD4EOBl4T
         lCWNKbrx11Sbgui7/Dwk6ZoVd4Zgyeq2IzQdugYuRSvx+hnXLmqs+AF1NMgriKEK155w
         XWQ5EO6vkgWbn8xzgJvwD42Yx0BJjtFh9dAh2lanW8oCPYtpSEGyfiZKwPjYWXt2dBMr
         qpZRh8XYdc7g/elyyeLSFNTedb3PtVwxLUFgcWKhm07mchSD9vIw/QUpsUmXT8hTTegw
         nPzow6u9yCtbIWE6fgKudbUgE8twpSieSeoBVQa+tXGNUPL2THqZUEFBDBFzHx74zqLO
         vWmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7+/zd45X78a+IOCS/VOJqYgJvX2WBxlt8LLZPp6Ukjo=;
        b=uyYnVi3usiO+XUvsne97Y2DfgvAmQv49znUqYi/awFvvFm9xFbpzWk0xsb1BVAwdW7
         uo7+JoMv3vJIbTcga1XRMdIqebYcwEr08y2s12uzUpfk4qTGoWN2UP1RAiaszagxQbbJ
         4bbqv8PuD49ffdLSCX5S0L0VXrIqm2xYLAsDleKQGWnRsZ2rzeZyxPmz/OLAVp89K5qa
         pBif8xps1Gi8sXh1/HAUgKphEiaqbquCn+FPlAKS8OhfFo5NgAYoC6T3P38Zj9dLE557
         0CMrK9Q9jV1Q7gwjlWh56PSYqD0NpnV7Rtiu//+DgSbbJIKNVaDT4FIAtGQ610im6+Qx
         vetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=7+/zd45X78a+IOCS/VOJqYgJvX2WBxlt8LLZPp6Ukjo=;
        b=BbVhht8JehLGDvKFegjl75GNxBJ2Js+C5gf8l4/nNt7n1A72lcAVciSmEqrh/ZzDZa
         pgJ3YDji3w5ld7LSPP6m2GiHk+ULgGOi/C30rZBKFUR4fzEyrkIjZT8yv/urwXun1qzB
         wBoFPT0jez7Yb+lXlcugYvJSK3vK5UZ/DzCKZOARYHWM/d467v/0oxKIYMuRD6W1wiom
         EhSnah4Ou+UqWjk6Awz4g7vKkYxaXg84ZO0dqCLfwnjvg+zcp4YUKVdNHWXbB2DjqNFm
         j0AjAJB0HeEylfToj7m33SbJueXtRYaeEHtBUK362xBQchQe7E9cjSLvLFFdYjj4/IOB
         etBg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWE/vxE/+xnvZ8dKr6tXp8lXmh9mKD5TxGnDYCyYmTso6iR7QIa
	B8oVQwdiRgOltJ05M8V6miA=
X-Google-Smtp-Source: APXvYqwUMomwid4tjixbr7Pg8+tgREgKwqeKB1jiasLBBZrzz6Xw5TRbYDtW7nmgJUl1GB80B00gYQ==
X-Received: by 2002:a2e:984d:: with SMTP id e13mr1634562ljj.61.1557391338397;
        Thu, 09 May 2019 01:42:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:48a7:: with SMTP id u7ls151382lfg.5.gmail; Thu, 09 May
 2019 01:42:17 -0700 (PDT)
X-Received: by 2002:ac2:538a:: with SMTP id g10mr1757231lfh.141.1557391337389;
        Thu, 09 May 2019 01:42:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557391337; cv=none;
        d=google.com; s=arc-20160816;
        b=nXe7zCTgdtgciJ4heqtq0Fy5XULvlyEIplDxf3Z6tKv7DnbghF23Bb9klbncdrvAPh
         vb2IQRxqhKa/4gRqDLNFy3mzwdIuY89Afk9Ai+vi1HZKxkKZnKS6yM/1x2QwJMNremD7
         N9jNrLIo+F7xNNCPZ0LPHjsle04v8oZ/DnwUAR+ETemve0dphhVtOSRla424iUQG3TsA
         f2ME5Bpd7IVHzEgWcDgqBAaPrHfgwPC3izTliT4EYtJC1dRlraGUoMyZ0nDMPPq/4ajg
         bfp4V+Jz8HrzmT10eve3+lpYYXFneW9x/KhfpulW3gr1QsLXvxWEt9qoa5FKtYakghr3
         f55Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=apWXjuK1X8H98dZ5tppfrUihNR4Jpw+rsLudKWlqQ4s=;
        b=E9pihIgsYyGoPLXi6VEf2BfVsZuxcpMVpfzOssxh9G4ohp279Qn8FFKKI8iRsH4wKB
         MM4sIaLwVO38YLZd5VeiXwFcGbAZ2TSm+5nt+Gsy/g6UT4D10PQa9boPh5/eyF/31/mx
         8zi+0hvh3G6gdjQz5OgdG//TVEpiLmOBZOxZoUIsrS0GSLkeA1IfpEVyMqXe3oEsMhMC
         w4JkGMcZBf379WOhLPaQGD+ZKWt+FubZNrv35xSgS4DzkkeJ12Se98dyHYIpd/rOXI/6
         5dBOJ4eVLygFqHOulJihhlnQZl2FF6Ye2P5lc+i1WdfMzJqEkS5ZSqRu+WwgOw813tFj
         /vsg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=nHkCJZVw;
       spf=pass (google.com: domain of jan.hoogerbrugge@gmail.com designates 2a00:1450:4864:20::42f as permitted sender) smtp.mailfrom=jan.hoogerbrugge@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com. [2a00:1450:4864:20::42f])
        by gmr-mx.google.com with ESMTPS id x14si512472ljh.1.2019.05.09.01.42.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 01:42:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.hoogerbrugge@gmail.com designates 2a00:1450:4864:20::42f as permitted sender) client-ip=2a00:1450:4864:20::42f;
Received: by mail-wr1-x42f.google.com with SMTP id w12so1815676wrp.2
        for <jailhouse-dev@googlegroups.com>; Thu, 09 May 2019 01:42:17 -0700 (PDT)
X-Received: by 2002:a5d:5701:: with SMTP id a1mr2087123wrv.52.1557391336942;
 Thu, 09 May 2019 01:42:16 -0700 (PDT)
MIME-Version: 1.0
From: Jan Hoogerbrugge <jan.hoogerbrugge@gmail.com>
Date: Thu, 9 May 2019 10:37:21 +0200
Message-ID: <CAD9j0toHJr+grA+2xjk2Yu1kP_m3TsFzWrGzVmBm+wdWiFMk4g@mail.gmail.com>
Subject: ARM v8a Hypervisor timer
To: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="0000000000006a31d30588706d2d"
X-Original-Sender: jan.hoogerbrugge@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=nHkCJZVw;       spf=pass
 (google.com: domain of jan.hoogerbrugge@gmail.com designates
 2a00:1450:4864:20::42f as permitted sender) smtp.mailfrom=jan.hoogerbrugge@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--0000000000006a31d30588706d2d
Content-Type: text/plain; charset="UTF-8"

Hi,

I would like to use the ARM v8a Hypervisor timer. I assume that the
physical hypervisor
timer is the one that I need. What I did so far is programming it via
CNTHP_CTL_EL2
and CNTHP_TVAL_EL2 and then I can see in the status field of CNTHP_CTL_EL2
that this is working as expected. Now I want to receive an interrupt and
then things
become harder. I learned from Jan Kiszka this is not that easy because all
interrupts
that Jailhouse intercepts are programmed by the cells with exception of the
IPI
interrupts.

Is there a Jailhouse / ARM v8a expert who can tell me what is necessary to
use the hypervisor timer interrupt in Jailhouse. I want to use it in an
imx8qm
system.

I want to use the hypervisor timer for periodically checking the guest
system(s) from
the hypervisor.

Thanks!

Regards,
Jan.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAD9j0toHJr%2BgrA%2B2xjk2Yu1kP_m3TsFzWrGzVmBm%2BwdWiFMk4g%40mail.gmail.com.
For more options, visit https://groups.google.com/d/optout.

--0000000000006a31d30588706d2d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hi,</div><div><br><=
/div><div>I would like to use the ARM v8a Hypervisor timer. I assume that t=
he physical hypervisor</div><div>timer is the one that I need. What I did s=
o far is programming it via CNTHP_CTL_EL2</div><div>and CNTHP_TVAL_EL2 and =
then I can see in the status field of CNTHP_CTL_EL2<br></div><div>that this=
 is working as expected. Now I want to receive an interrupt and then things=
</div><div>become harder. I learned from Jan Kiszka this is not that easy b=
ecause all interrupts</div><div>that Jailhouse intercepts are programmed by=
 the cells with exception of the IPI</div><div>interrupts.</div><div><br></=
div><div>Is there a Jailhouse / ARM v8a expert who can tell me what is nece=
ssary to</div><div>use the hypervisor timer interrupt in Jailhouse. I want =
to use it in an imx8qm</div><div>system.</div><div><br></div><div>I want to=
 use the hypervisor timer for periodically checking the guest system(s) fro=
m</div><div>the hypervisor.</div><div><br></div><div>Thanks!</div><div><br>=
</div><div>Regards,</div><div>Jan.<br></div></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAD9j0toHJr%2BgrA%2B2xjk2Yu1kP_m3TsFzWrGzVmBm%2Bwd=
WiFMk4g%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://gr=
oups.google.com/d/msgid/jailhouse-dev/CAD9j0toHJr%2BgrA%2B2xjk2Yu1kP_m3TsFz=
WrGzVmBm%2BwdWiFMk4g%40mail.gmail.com</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--0000000000006a31d30588706d2d--
