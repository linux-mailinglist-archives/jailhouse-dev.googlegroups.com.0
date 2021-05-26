Return-Path: <jailhouse-dev+bncBDWK5VGE4EPBBNO2XCCQMGQETVWNYPY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x637.google.com (mail-pl1-x637.google.com [IPv6:2607:f8b0:4864:20::637])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7053915C0
	for <lists+jailhouse-dev@lfdr.de>; Wed, 26 May 2021 13:12:54 +0200 (CEST)
Received: by mail-pl1-x637.google.com with SMTP id t13-20020a170902dccdb02900f0bc643e1fsf510632pll.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 26 May 2021 04:12:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1622027573; cv=pass;
        d=google.com; s=arc-20160816;
        b=0kNJbvu+PSoDVH8wK5ZC7LouoxfKmHYrvj4G6rShF5jTHdhizsekhLX7wkHDJktgay
         UbM59NQQgYTIhyLehD3PovuW6CoUsi+FYxnntul3iArdxS6XlLpzX8R6v/eWUvgyZqAH
         ap7EpuL9FlgYHwTU78WCyaKOmr2BVM69eHK3jFR9TVidOuhvCRzxaOqEp5YXiuwxh+bs
         cwGq4YQ/6N99UsJctf5nZCp9U15IMYGjifvb13EaveaF0f1fCG1H9oJDSIeeXkMTUuhG
         yMLOTjxm+vpFIQMfDo5IVLNJN4MWQUstPHwoQWJDtFjsyy07HfgJRzv5IBTE2uJji+f9
         xT5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=F1AWC95+DJ5zPTJaoUKCD8658AhnKCi4sL2fUR0aHiQ=;
        b=G7COqyn4AbktTugc3HmTnk8wbKnhwHuQzdnxeQ8jSJo6GobegsJaaAjDGnvcieScpx
         kEV2G9/X8YUeT2L+aatZpY+RE6g44B+bG5y1WjrFyl6kvhhH3G86gTi0h8XLPpdsPvg2
         YksYry0sBYT7Gved+rbZ3pqUnSZ6Fz62TRSm9GYSz0z9l53TA/m97bo5uGXw7KeeRYq+
         NXXcZC5H2c/D2g7i0ewQcrjhuQphp4lNL/7HVz45fpu+31eEJHNSgcZ3rd72E4BLv0vU
         U058tWyVZazbku+80YjCvHfWXIug8ck0Kyvjd3BElyj95DOVVNaaEHGiAMNs6XVU5Gjh
         fYCw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZvLlH3zH;
       spf=pass (google.com: domain of prashantkalikotay1995@gmail.com designates 2607:f8b0:4864:20::336 as permitted sender) smtp.mailfrom=prashantkalikotay1995@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=F1AWC95+DJ5zPTJaoUKCD8658AhnKCi4sL2fUR0aHiQ=;
        b=WkduHSgo3Uw6VXIu+1BuTVo65x5eA3J9L/gK4eKAHVBNFkC05iWEk1H4kq6ZrWa/Yj
         dTkPFoeOxbwS7OmpQl6PXfvA7xHJQhyW/UMP7yzZmkZmrN1vqMLyXeWQEgSN8HE5khpT
         Y93mx/9ctYWL1pNGYYTplV7FiUhloCEiRpv/p00BckvhsvwdljShRQrQuxftd4hQLCSC
         t042j2ijZXmRYSJFFU4RgOBHxklUKmWpt7QJlPXt0Ov6AX3JmT6Sw86GCsg8czlTX5Ir
         eVk1348srXgMWlvftDvLALcM2rcMYOnVsr8ch3/n+fYaSakp2fLoneiovcxJDxwkQKh7
         OBFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=F1AWC95+DJ5zPTJaoUKCD8658AhnKCi4sL2fUR0aHiQ=;
        b=cd88+9t6KKkKi4rdCcpUBuarryFltE/Zwhyg+hlQ8q0dc+WMlMnKuma2z9B1sE3DZO
         JAdf+eG1iql2xMLgrIRqQS5QVIK6qhIvPANJ28T5/0TY5i/Qv5xBn6rYZQdvKdXlLAD7
         KTY/jW55tUYcgrjGOGqsAvYLDwWQoIFCkeEx8k1M27D3E/eFeQI6tvjiAMOATBJsk4v2
         zqcYSgWdOT4ijvooRBOcc+dGfMoxc03NY8lZ+wbEz4qxqZoaC1cZXTfJUXx9cBs0ex8Y
         9h/E7larbDIsHDTaIsoRrRticuzCDbWPGRHV6jRiQIw+Sp6x8S1SDw/FyhN+/f+G3pIa
         6bsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=F1AWC95+DJ5zPTJaoUKCD8658AhnKCi4sL2fUR0aHiQ=;
        b=ZBDvA4bBQ1GgsupSN4MxidgqmsS/p4git6FKvlzTHKb0SnLX2YUsgDb9T9UeWN+c81
         d8Kr2ap2Q5DmT9QWNe3jEKgNvv/LNHYCyzNzSl7ifcD++pKYegzhTS9Z0zpqk4mNHs9q
         9DZ5yCShZurU3YQrPqTZS63h2uMHASxBaDOEdRnh+rQGiWNabnkx73QZIEM2Y3F12eNy
         +rweddTfWHkfA+WuUvxfgU0SlfXwGXlBmTDN97f3eWrMdKPayxC2YnL6G8Goj9UBORPJ
         hBOfBZ0n/3YmEjXFudbEjgZ+PayHBWFancQ2GB1VTAf8cC+eASxZ5DbdmZWkip0k0ywH
         Zwyg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530X4oQIVEZxvgnsVQQ1XaPjpkIOFOnWSIvbtYdc5lu4U+tlrEE5
	RO87MSHmqOqVIsF9KAVdBpI=
X-Google-Smtp-Source: ABdhPJxQ1RiT9R2uFQj4lfhlKAilWFJrTOdrwC1zAju2zCWiS6JvP1LR+NAwU96s0+45lh2KfzwH1Q==
X-Received: by 2002:a62:5846:0:b029:2e8:fde9:5c6d with SMTP id m67-20020a6258460000b02902e8fde95c6dmr11298349pfb.56.1622027573641;
        Wed, 26 May 2021 04:12:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:aa8d:: with SMTP id d13ls12234249plr.5.gmail; Wed,
 26 May 2021 04:12:53 -0700 (PDT)
X-Received: by 2002:a17:90a:d24f:: with SMTP id o15mr3428277pjw.83.1622027573027;
        Wed, 26 May 2021 04:12:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622027573; cv=none;
        d=google.com; s=arc-20160816;
        b=AbrvBAxpH5iifDU5ix+/KdObPKOTBIdBhb+ZZUJR5rv+rHI28hkTVa+XgV4qKIxVFh
         A037rHiPS/ogv0IoXxhwMjufD1iDkwnXHPbQLXVNHn1fGdg4g6T+ICWafj37XiiIMlnn
         6meBllA7+LcnaOCZLTdKnSBzhC+8ug/IK1SVUoh9AVCJrkDLJxgpioYLJRK+R6dj545P
         3styBMySJQVR0TC5IAKg/vSN7kIlrdqMFx5f55KKE2DPPQve4Nez9+fk6Tz7yxjd1hFB
         dNQ7yvDEmJofsQAH3vX96KGdfdhpmEhRqfzZxpTvYsRbOMvrPJuxrJ8rvCQqJtlrACxC
         7hKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=7/lGPcZUAe2cogCPWzbl0lV6OEYDjj75KZApsoGkPJg=;
        b=TDH2mL4Wdags3omXncIO/jKm0se6pV3pAl+2grdgyIPhmSIj+1lp9toiek5p6e17c4
         XL4UjTQImaYW6Zjtk4JAKUmqH1IF3Yeq2kigKfdFY4PHBK27FTa+o19RXY0ltfF+ZS+d
         HtO80yOHcWdVoSVkmP/CILqsQ3zPx4uu+hlWcup2ofmG7bxLXjIhtK9tFejkwGQgBCGO
         WbudzAAPVGfPveYUcbuMinbO0dCX9rA94Yz8d43sjfxoVGF7mF2G/9s1YyW5mD/hRSm5
         bfMYWrKFlj/sBdNhxCA5rbCryXc9DTLpqGrspaLXV4tIagv/2dOG7nQPJk/aT8E2UnQb
         W3pw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZvLlH3zH;
       spf=pass (google.com: domain of prashantkalikotay1995@gmail.com designates 2607:f8b0:4864:20::336 as permitted sender) smtp.mailfrom=prashantkalikotay1995@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com. [2607:f8b0:4864:20::336])
        by gmr-mx.google.com with ESMTPS id e13si91787plh.0.2021.05.26.04.12.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 May 2021 04:12:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of prashantkalikotay1995@gmail.com designates 2607:f8b0:4864:20::336 as permitted sender) client-ip=2607:f8b0:4864:20::336;
Received: by mail-ot1-x336.google.com with SMTP id n3-20020a9d74030000b029035e65d0a0b8so628898otk.9
        for <jailhouse-dev@googlegroups.com>; Wed, 26 May 2021 04:12:52 -0700 (PDT)
X-Received: by 2002:a05:6830:1591:: with SMTP id i17mr1937155otr.181.1622027572273;
 Wed, 26 May 2021 04:12:52 -0700 (PDT)
MIME-Version: 1.0
From: Prashant Kalikotay <prashantkalikotay1995@gmail.com>
Date: Wed, 26 May 2021 15:39:36 +0530
Message-ID: <CAEoyBwAnGc_qtFv1npqjZRY0OTg+tsREkdP0kd3xiapoAh3msg@mail.gmail.com>
Subject: Jailhouse command error
To: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="00000000000042e46705c339b9c0"
X-Original-Sender: prashantkalikotay1995@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=ZvLlH3zH;       spf=pass
 (google.com: domain of prashantkalikotay1995@gmail.com designates
 2607:f8b0:4864:20::336 as permitted sender) smtp.mailfrom=prashantkalikotay1995@gmail.com;
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

--00000000000042e46705c339b9c0
Content-Type: text/plain; charset="UTF-8"

Dear all,
              I am trying to checkout Jailhouse in a virtualbox/debian OS
running linux kernel 4.19, x86,  it installed successfully i.e. make and
make install were successful.
However when I try running  $ jailhouse hardware check I get this error
message:
root@debian:/home/prashant# ./jailhouse/tools/jailhouse hardware check
Feature                         Availability
------------------------------  ------------------
Number of CPUs > 1              ok
Long mode                       ok
Traceback (most recent call last):
  File "./jailhouse/tools/jailhouse-hardware-check", line 147, in <module>
    iommu, _ = sysfs_parser.parse_dmar(pci_devices, ioapics, dmar_regions)
  File "/home/prashant/jailhouse/tools/../pyjailhouse/sysfs_parser.py",
line 338, in parse_dmar
    f = input_open('/sys/firmware/acpi/tables/DMAR', 'rb')
  File "/home/prashant/jailhouse/tools/../pyjailhouse/sysfs_parser.py",
line 90, in input_open
    raise e
IOError: [Errno 2] No such file or directory:
'//sys/firmware/acpi/tables/DMAR'

could anyone pin out the problem thanks.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAEoyBwAnGc_qtFv1npqjZRY0OTg%2BtsREkdP0kd3xiapoAh3msg%40mail.gmail.com.

--00000000000042e46705c339b9c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Dear all,</div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I am trying to checkout Jailh=
ouse in a virtualbox/debian OS running linux kernel 4.19, x86,=C2=A0 it ins=
talled successfully i.e. make and make install were successful.</div><div>H=
owever when I try running=C2=A0 $ jailhouse hardware check I get this error=
 message:</div><div>root@debian:/home/prashant# ./jailhouse/tools/jailhouse=
 hardware check<br>Feature =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Availability<br>-----------------------=
------- =C2=A0------------------<br>Number of CPUs &gt; 1 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ok<br>Long mode =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ok<br>Traceback (most rece=
nt call last):<br>=C2=A0 File &quot;./jailhouse/tools/jailhouse-hardware-ch=
eck&quot;, line 147, in &lt;module&gt;<br>=C2=A0 =C2=A0 iommu, _ =3D sysfs_=
parser.parse_dmar(pci_devices, ioapics, dmar_regions)<br>=C2=A0 File &quot;=
/home/prashant/jailhouse/tools/../pyjailhouse/sysfs_parser.py&quot;, line 3=
38, in parse_dmar<br>=C2=A0 =C2=A0 f =3D input_open(&#39;/sys/firmware/acpi=
/tables/DMAR&#39;, &#39;rb&#39;)<br>=C2=A0 File &quot;/home/prashant/jailho=
use/tools/../pyjailhouse/sysfs_parser.py&quot;, line 90, in input_open<br>=
=C2=A0 =C2=A0 raise e<br>IOError: [Errno 2] No such file or directory: &#39=
;//sys/firmware/acpi/tables/DMAR&#39;</div><div><br></div><div>could anyone=
 pin out the problem thanks.<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAEoyBwAnGc_qtFv1npqjZRY0OTg%2BtsREkdP0kd3xiapoAh3=
msg%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CAEoyBwAnGc_qtFv1npqjZRY0OTg%2BtsREkdP0kd=
3xiapoAh3msg%40mail.gmail.com</a>.<br />

--00000000000042e46705c339b9c0--
