Return-Path: <jailhouse-dev+bncBAABBTHR4OCAMGQEJN6EFEY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F839377F27
	for <lists+jailhouse-dev@lfdr.de>; Mon, 10 May 2021 11:11:40 +0200 (CEST)
Received: by mail-ed1-x53a.google.com with SMTP id c21-20020a0564021015b029038c3f08ce5asf3205398edu.18
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 May 2021 02:11:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1620637900; cv=pass;
        d=google.com; s=arc-20160816;
        b=dKaWD6o5oapJVqbm4lpNuI5dnXRumYBARp2KOh+V0KO4O5UKjlTMaJCfJIruEzb3hJ
         EhZQr2Xe9xbAfZ/V1bU0yW8dlGGt916n5eC4McPgbXuI82cRPsw3CmSxPgFnpH8BzMIj
         BVutHLIT7r4M/wZ+MveJqPJDDiZHHVV2UpmRazSMooVzJG2gsHAkablSqbM5b/73mz2J
         /cJohqhl9UImS9OLXrnnSFdHhB/76u2NvSmRzjjcqxcTTW5l8I/wuXr+UhMI5RrJIA/7
         /4jDIl+RXKVBZrA4DHRP0IIUTUUgzfZm//lXZzvuJWZYuehKHyAKinYgPi2e5sAgvr+7
         Cd+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:mime-version
         :content-transfer-encoding:subject:to:from:date:sender
         :dkim-signature;
        bh=1rMyZ/EX49J+Fn6cR2qz9gFwjBZUG6TfGdZ+fcJAKQQ=;
        b=DSNqZXIwfAc5n35EE2gRl3HKo7g1Q5vhPnIXEYIvJTRPowhm2Rba3230Gn4YTOPVaV
         03l0TZKdKBHnkPE+AcIBIqN611RRJck8APg77m9EHzJcHMJLme/AnOawMxb/3e6ptoYW
         LbX7XYOitjpjIpoxZ5yeieijx/SyeK5dS+E03m+WoT39zFWiygmtVR7/lUA/hAUEHZaU
         pBvIC907DdKmLaz31ikHir4bsCjkN6BMYaHOoaqTwwlaSy1ynt0/QlesbKGsYQsHkin6
         2Xwn56FBgQB29FGVcQCZAwPk+fgjPjD1m7Jenv3RK8b+HYnphXhbTsyzHSPnHt8QboK0
         GxHA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of caohp19@lzu.edu.cn designates 165.227.154.27 as permitted sender) smtp.mailfrom=caohp19@lzu.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:subject:content-transfer-encoding:mime-version
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1rMyZ/EX49J+Fn6cR2qz9gFwjBZUG6TfGdZ+fcJAKQQ=;
        b=Vx6/Kq0Ktf5qc8E+RvFLmtmUSj94uWF8rNoCL4Xu/vXN1IfCEAohdyr6cB5d/HIo24
         l/XjKtxveHu1qoNs0RJ+LuZrTrhyVIAx7ITEHnpdr7RY2CEFj7DTrXQsWvfIpoxvyaS1
         WSB/SsoWN5v8/u/U5w1XZs4twxjUK7JU/w9jAUymO1FUCs0yaF4kHtCKtaK5BEQxlKZU
         ZsyPXk6Rgt2h6iPFPJ9DZTMmKrlTqmeN70yf9BNyzzSm61sBhedn1Ck9+F/toX+RkKnn
         CBkEu5KQHTFwwCgUBGcqE/uM+bmOfhjGYTRBfiMNdC4ZTI3/IlExM913AVC3UQJcTCLO
         KuCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:subject
         :content-transfer-encoding:mime-version:message-id:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1rMyZ/EX49J+Fn6cR2qz9gFwjBZUG6TfGdZ+fcJAKQQ=;
        b=hF5bPmruwWm7FFdnN70cOQvwlK/qes3oBaTrtKL+PG3UUEnvqD9bjvc0uA/4ex1GHF
         WgyOLXn7WxMT9vnDwLXNVF/SSUhoDxAfsDX5T53DCFEhvx3GJTgkPPIcyYtoUBGFRu0S
         DYY1iVV+HnV1kprMDGy0jBqf0Ora0/Fm5xgNbrb1YeXrfwAA0M2ZKpjEbIVOXLH0Ug6j
         qJJvlP1nqae4KvftrkAT4n/wdbQ7DPlW1G6pD6GFXvtfZNcvtz6BX4XPtao2JIy484CM
         Prhj7P2pDpQt0zi/1Z+TgwFzJelf5KgapR7v1vsq+RPXHI/Vn+LG0liRnLyv3KnAAPIH
         ihcQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531B+e0POLymlJwjlNO+EkMAHPiOP7DW4dgMc8E4JdSdjESmfJor
	65nyfq4reF1kRA2lE9Da0dY=
X-Google-Smtp-Source: ABdhPJyMs0d581bli7oc1JIv5TRRI1aYUXEyIRvoVYI4UiD0VimP90Z6REBj4hJ9DA4rSGB1tnzvnA==
X-Received: by 2002:a05:6402:36d:: with SMTP id s13mr28508037edw.103.1620637900307;
        Mon, 10 May 2021 02:11:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:1901:: with SMTP id a1ls6143896eje.0.gmail; Mon, 10
 May 2021 02:11:39 -0700 (PDT)
X-Received: by 2002:a17:906:7f8e:: with SMTP id f14mr7491302ejr.510.1620637899464;
        Mon, 10 May 2021 02:11:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620637899; cv=none;
        d=google.com; s=arc-20160816;
        b=CPt0QdUZ5yj41zNuQkc4l7rR065/D5C7d23VHpC0MdXAx79/OOeRqgBGOvQPONcKBy
         qK0w03Imxpdk6RJmy3WK+wyNufVqxhr17wBrfKGwrSy8Y26eKRHlda6imQCglEN8CnKN
         cIRUsy1034ahFCjMWPJtLGHadqccqnumOHJQfT05hlGVfjuGgBmb/oMe1BcwfgD5jsYc
         cxDQrCkNw6xBA2K3LOLnXjNV0s/azSJmX4IqROz7XFAWZpCex0pdT+e3d/Ovr1hfzbcb
         1+5c3ejSAql/wxGJscqf7NlkjXlHNcyVkKdGZiLEqK1+u6P6eodwwGZOWWX/ybxvkueB
         TN3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:mime-version:content-transfer-encoding:subject:to:from
         :date;
        bh=So+18XvGpoJXC/h0UIVg73jXQZqXvtZQRpYUrxGAKBo=;
        b=IhpQTpEnLNOtG4Cgt5/Fos66LQL3NZDDmRS/9LimWZBOUVCeNDOJacknM9T2hZFplS
         qqbQ6JRW21CYKEnHyYs3FznUoLKQLOPuloZZdfGa53qbqRvLIVjmMtCMzEX/BAE0ywOY
         Wuc/5hYCWHZmehkueqfKLecS/G3rFQp1xU9y8ZW5Rln4dyGZA+W6wLRdT80Yu/a4b8T9
         tBa0F5EEZMyp++IH5XQQ2EMhjJqZYCZLNsNgyJmI+CKp48UcGjOF1d6WJGJiB//C2ead
         Iw8thi4cbsLodBv9AxFql++lMm2B22eZwqhwJN7u3Tf2UAvVsGxM2wJNkZP/aOrZHhxN
         v07g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of caohp19@lzu.edu.cn designates 165.227.154.27 as permitted sender) smtp.mailfrom=caohp19@lzu.edu.cn
Received: from zg8tmty1ljiyny4xntqumjca.icoremail.net (zg8tmty1ljiyny4xntqumjca.icoremail.net. [165.227.154.27])
        by gmr-mx.google.com with SMTP id di23si570482edb.0.2021.05.10.02.11.38
        for <jailhouse-dev@googlegroups.com>;
        Mon, 10 May 2021 02:11:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of caohp19@lzu.edu.cn designates 165.227.154.27 as permitted sender) client-ip=165.227.154.27;
Received: by ajax-webmail-app1 (Coremail) ; Mon, 10 May 2021 17:11:36 +0800
 (GMT+08:00)
X-Originating-IP: [210.26.59.142]
Date: Mon, 10 May 2021 17:11:36 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5pu55a6P6bmP?= <caohp19@lzu.edu.cn>
To: jailhouse-dev@googlegroups.com, jan.kiszka@web.de
Subject: HELP about Jailhouse
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.12 build 20200616(0f5d8152)
 Copyright (c) 2002-2021 www.mailtech.cn lzu.edu.cn
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Message-ID: <2d145c5.8415.179558bd06b.Coremail.caohp19@lzu.edu.cn>
X-Coremail-Locale: en_US
X-CM-TRANSID: ygmowAAHRfrI+JhgM+coAA--.10971W
X-CM-SenderInfo: hfdrx1arz6z6vxohv3gofq/1tbiAQwRBl2vOvZLbQAAsC
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-Original-Sender: caohp19@lzu.edu.cn
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of caohp19@lzu.edu.cn designates 165.227.154.27 as
 permitted sender) smtp.mailfrom=caohp19@lzu.edu.cn
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

Dear sir,
&gt; Dear sir,
&gt; &gt; Dear sir,
&gt; &gt; Last year, I used the rapi-linux-demo.cell to launch a second cel=
l on my Raspberry Pi 4 model B. And the memory size of second cell was abou=
t 184M.
&gt; &gt; However, that is not enough to me to execute some test on it. So =
I try to change the size of the cell in the rpi-linux-demo.c, but it failed=
 (maybe occupied
&gt; &gt;  other's memory, I don't know). A good news is, someone fixed thi=
s problem. The demo can provide 1G memory size=EF=BC=8C and I git clone the=
 new project.
&gt; &gt;
&gt; &gt; BUT when I executed the operations same with before, I can not bu=
ild the jailhouse
&gt; &gt;
&gt; &gt; my operations is:
&gt; &gt; 1. git clone https://github.com/siemens/jailhouse.git
&gt; &gt; 2. sudo make &amp;&amp; make modules_install &amp;&amp; make inst=
all
&gt; &gt; 3. sudo insmod driver/jailhouse.ko
&gt; &gt; 4. sudo jailhouse enable configs/arm64/rpi4.cell
&gt; &gt;
&gt; &gt; The 4th step is failed, the error is:
&gt; &gt; JAILHOUSE_ENABLE: Invalid argument
&gt; &gt;
&gt; &gt; I don't know why it occurs. Because there are two project on my R=
aspberry (one is new, the other is cloned in last year ), the old one can r=
un properly.
&gt; &gt; If I can get your generous help, I will appreciate.
&gt; &gt;
&gt; This means that the hypervisor memory region configured in rpi4.cell
&gt; does not match a memory reservation done via the device tree. It likel=
y
&gt; overlaps RAM that is in use by Linux, thus can't be taken by the hyper=
visor.

&gt; If you move the hypervisor memory region, make sure to adjust
&gt; https://github.com/siemens/jailhouse-images/blob/master/recipes-bsp/rp=
i-firmware/files/debian/jailhouse.dts
&gt; as well.

Thanks for your advice again! From my perspective, whether it was caused by=
 Linux version or not.
And I execute

1.git clone https://github.com/siemens/linux.git
2.git checkout -b jailhouse-enabling/5.4-rpi
3.git reset --hard 57e5db56e9c9511c4371c61065334a689af60a72  //I want to cl=
one this version=20
4.make menuconfig
5.make &amp;&amp; make modules_install &amp;&amp; make install

However it is failed and still not to enable rpi4.cell. My solutions is rig=
ht or not.=20
By the way, according to your advice, I need to alter the jailhouse.dts rig=
ht?

If I can get your generous help, I will appreciate !

Yours sincerely,
Hongpeng Cao.
  =20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/2d145c5.8415.179558bd06b.Coremail.caohp19%40lzu.edu.cn.
