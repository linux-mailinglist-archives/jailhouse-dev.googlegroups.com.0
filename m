Return-Path: <jailhouse-dev+bncBC653PXTYYERBCGHZSGQMGQEO5TZBGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf40.google.com (mail-qv1-xf40.google.com [IPv6:2607:f8b0:4864:20::f40])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F21146FE30
	for <lists+jailhouse-dev@lfdr.de>; Fri, 10 Dec 2021 10:53:13 +0100 (CET)
Received: by mail-qv1-xf40.google.com with SMTP id 1-20020ad45ba1000000b003bdfcecfe10sf13670428qvq.23
        for <lists+jailhouse-dev@lfdr.de>; Fri, 10 Dec 2021 01:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=UURWXEVniJ659js2JShHzqAoAeWMurUAzBiGiIEsBYo=;
        b=cHxIQOp7Bqar6YvCuCGRuDZrdk9ToUzNZkHqk9xp6ZSN8oU8vaTvBeCt2ezknAY3JA
         o4RUFHaaT2ta/bIJZkifBZcli+vjZ22MvEi4s0JzKpk0Dfd8yBZD/bspL85g6/hUYdol
         wNUdJ46y8qMZYZ/WvZYW3XmxhAgbaOYouh6crSu1TOImvlxwTnNbHHLiiNGQDggLQaB1
         w+mED+odv/4M1TiSq28v1KHWqFskuCBCTBowkrIDgZZb/ArA++qye5UtHGYzqwQvFdxd
         GiUBh/snCeBG1ncJzNhltLVbKyoynWyYIy6vNWO1fYmBfpVu2+I9pc1cuILakV98uLq3
         cP8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UURWXEVniJ659js2JShHzqAoAeWMurUAzBiGiIEsBYo=;
        b=hO1ESk98Bs9kY+Pivaov2LeF1JCjc3di96wzYtC+HWAr8yeI8Oq+M8RvjUVLbj9cfa
         zenqDmiXX+tsDVMxhb0U9NMbL2bU0YKPPRYx+pwda2Q2fe1fr04QFZBLES/jn5SlackY
         DvekNZyNtaDeqa8Qr0IZQJnhYtuYRtRenlJk53TH8QJjj0LIDi/0ffbxyZ+ShOydMLck
         s5taAGSXjcx6p1t+pF1dVudGKis79RluqOcDcCBhHA38p9RBTGPTjC7ku8HH87qZqOuC
         P1iQcc5HIp/lMlnx0QaehZpFnoYs3s/Ww9E+UMdizwGrSUh4e4EqfTgh8OSh169kv06w
         pdbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UURWXEVniJ659js2JShHzqAoAeWMurUAzBiGiIEsBYo=;
        b=Mig2ojkix/4k81qokjzvkPX0xHaduuGVE3GBzl2KcXQe+Bgg8NP7PD7ZCfJgf1BQnI
         0tmkotu7XpruOdU/k4xGG6jBjIHg+qQJjjYLFAKXrOCg6CqgX0D4AYjoX68Lwt+Yl7qK
         ZtZw3s5mxpc+AP1wi4AOPg1NciyDNd6UscUx0SfUVFkVrXz/Xwl+fyebxuSh4QnfnXR+
         B+Aw13qq1bs+bRlyBcLrENNAxqsAnQKipAFivJNgvq1CK+DlIMdFn0h22VgesiAzExiU
         /F9zfyxJJaURyuy6EcvSVcMxQpfkKCZyDs5XuF+hpI7m/zClBdzF7/dForrUrI+AnnLc
         7YYw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530lqtsc1t0is0OnIheZRP9E+gLQaqopMcqiNvnBdYHUGY/alGzr
	rRg5C/SoFvIBhny5demuPtY=
X-Google-Smtp-Source: ABdhPJyen45oL1c91uS1+t0YCjbST6qkP3eyoT22MUApCFNa7GQB5dQPVNOlWQ4jkt/W3N2XxFzs3w==
X-Received: by 2002:a05:620a:170d:: with SMTP id az13mr19297222qkb.491.1639129992239;
        Fri, 10 Dec 2021 01:53:12 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:622a:1a81:: with SMTP id s1ls6261683qtc.11.gmail; Fri,
 10 Dec 2021 01:53:11 -0800 (PST)
X-Received: by 2002:ac8:7dc1:: with SMTP id c1mr24699117qte.275.1639129991623;
        Fri, 10 Dec 2021 01:53:11 -0800 (PST)
Date: Fri, 10 Dec 2021 01:53:10 -0800 (PST)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <0e3feaf8-c623-4ba6-8925-e648c946f148n@googlegroups.com>
Subject: NAT bridge
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_176_981901110.1639129990978"
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

------=_Part_176_981901110.1639129990978
Content-Type: multipart/alternative; 
	boundary="----=_Part_177_1975470135.1639129990978"

------=_Part_177_1975470135.1639129990978
Content-Type: text/plain; charset="UTF-8"

Hello, 
I am using the latest jailhouse-image for Raspberry Pi4(RT version). I am 
trying to create a bridge between wlan0 and jailhouse NIC, I learnt that 
the Ethernet eth0 is used as physical jailhouse NIC. So, 
1- Edited defconfig
CONFIG_IP_NF_IPTABLES=y 
CONFIG_BRIDGE=Y

2- installed dhcpcd5, dnsmasq and iptables.
3- I always get this error, while using iptables:
can't initialize iptables table `nat': Table does not exist (do you need to 
insmod?) Perhaps iptables or your kernel needs to be upgraded.

I understand that this is not Jailhouse specific, but I tried the same way 
in a different kernel image and it was working fine.

Regards, 
Moustafa Noufale

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0e3feaf8-c623-4ba6-8925-e648c946f148n%40googlegroups.com.

------=_Part_177_1975470135.1639129990978
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, <br>I am using the latest jailhouse-image for Raspberry Pi4(RT versi=
on). I am trying to create a bridge between wlan0 and jailhouse NIC, I lear=
nt that the Ethernet eth0 is used as physical jailhouse NIC. So, <br>1- Edi=
ted defconfig<br>CONFIG_IP_NF_IPTABLES=3Dy <br>CONFIG_BRIDGE=3DY<br><br><di=
v>2- installed dhcpcd5, dnsmasq and iptables.</div><div>3- I always get thi=
s error, while using iptables:</div><div>can't initialize iptables table `n=
at': Table does not exist (do you need to insmod?) Perhaps iptables or your=
 kernel needs to be upgraded.</div><div><br></div><div>I understand that th=
is is not Jailhouse specific, but I tried the same way in a different kerne=
l image and it was working fine.<br><br>Regards, <br>Moustafa Noufale<br></=
div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/0e3feaf8-c623-4ba6-8925-e648c946f148n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/0e3feaf8-c623-4ba6-8925-e648c946f148n%40googlegroups.co=
m</a>.<br />

------=_Part_177_1975470135.1639129990978--

------=_Part_176_981901110.1639129990978--
