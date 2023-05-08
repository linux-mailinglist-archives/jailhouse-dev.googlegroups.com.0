Return-Path: <jailhouse-dev+bncBDX3XUVNVULBBFNM4GRAMGQE357OV2Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x737.google.com (mail-qk1-x737.google.com [IPv6:2607:f8b0:4864:20::737])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5076F9D8A
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 May 2023 03:53:26 +0200 (CEST)
Received: by mail-qk1-x737.google.com with SMTP id af79cd13be357-757651cd5adsf214737785a.1
        for <lists+jailhouse-dev@lfdr.de>; Sun, 07 May 2023 18:53:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1683510805; cv=pass;
        d=google.com; s=arc-20160816;
        b=B2DeQqAf/jfZwLzB9XQKdBYe41jjJVIUwB6L3xi8qHkbNdRwcZLFngGFe5/Lncb8sH
         V8FF1Uk5xL6Xk0eh8Vuzae7coJRHHgPyWkBql2RFaGzDLXI1L3gztBPhztIRVQF2UidI
         7wQX0shyppgQVQl0YPxdpfWsJodEuZDmRLTwQa/4wqQ8vcu2fr6PPlN+DNLzyX3pFsl3
         uIrwml4BSCexdW+eYN8j98O0rAA3dsvv79RSaKZFYzlRjoYTJkC5OQZ+i1/wJ4U2r5lR
         T8a0+1OWiFNsdxevDOlZ6u6ZfD1iUhPFtww7OUy8khoTQw4TEpx3Ff9Air1rjNibiCX5
         9yww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=9hcqd1DTWVsHOx6KMlUvIurzBXlzZ6ZdMOLbsarKdDk=;
        b=fCOevm1RaOCVGU2KZZ9n5R79kuUE7Edb5tmFXRxZn47/uPqMITwG1oe3Ihf3/1Pl3+
         nDZ6TnedcOZFufwlNWHcVBYo7FfO41XKdvArV15LjBpcwax4L/0W3uXBFNI63c+1YbRY
         IBRIf3bTMhPRh+3fw9076WHA+Bk7OOoLp1SqVuS0bRMgivhCZLOpt2E42wYIKkB6nCQh
         rPFvPztozP/V9nlNh3z+Y8jtXkggNMMv1mgKstJ1HXRFDFa0Wy1r7ImHkEWqEodSpwPe
         HjTBlwOSnN8WCWSwvhb6AfMyoSPxYc3EB+3F74EVpjrgpBZqfA7nBilzi/o+dwpcfpW5
         g5dw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=lU4MgAy6;
       spf=pass (google.com: domain of kurtzou@gmail.com designates 2607:f8b0:4864:20::533 as permitted sender) smtp.mailfrom=kurtzou@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1683510805; x=1686102805;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:mime-version
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9hcqd1DTWVsHOx6KMlUvIurzBXlzZ6ZdMOLbsarKdDk=;
        b=kddsxIxzdmve96DckqJjkoOqHU6CJWz+RBwBhmEfZBwGEiMQG+9DAYkp7nN7YGreZg
         RbHgUHQliiQbgPs3oyXhNIWL+4P7FJuQ13WiYWOlypPpZU4bu9CpmZjeOWxra9LMkZ6R
         WomL1YWwWyxeat2NyCB0O31yqZ79wdhibC1jFjfjSmVVYGEvwp7JPoZCSdxruzrpRSwm
         q9oZzx4IWgmISLEW8/Jd3P+DQncN1vuCgC+QGrsKI+MX3dgz+9S96YHwGBDqbqhlBaNB
         5B5BYDr1PVVd7NbQOgDep9E/CcBsFAAk2Wl9CdpnvCYCIGZTGG9JS00dBeh2CZwUULOs
         Rijw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683510805; x=1686102805;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9hcqd1DTWVsHOx6KMlUvIurzBXlzZ6ZdMOLbsarKdDk=;
        b=pArtvLD8v6c6a/0fAwFMlKWVrOa5qo9V3L0ewCVRMdvCszV4O5NUu2IkSkCI+74mdo
         7FLHldLiQO8NgA0h9PsoBI0Ptt3FOZggc2rTLFaXwqGPevs5Q0yYTZStKGSuCu36DgfF
         jAE5+L8DkYaScuKEidiyVdblGjMYv28vb5RfDv2SDzRKw96VUgGP++ziTD0J9ZnBBySW
         b45qKq7UB0VQojDEMA64YKEpWHGUyKuUIEq8sN3nFNo+XW/CpfmwqgEwbCRL2e4pSnn2
         eQTbzbgYOW81rm0hQn55eSbtLC6TRIi8EOXXDMAz1bv5DVRuIHsbk0N131l3+e+ZbBML
         797A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683510805; x=1686102805;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:to:subject
         :message-id:date:from:mime-version:x-beenthere:x-gm-message-state
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9hcqd1DTWVsHOx6KMlUvIurzBXlzZ6ZdMOLbsarKdDk=;
        b=lcX2m/Iv8UAl4/mxvZMoESDn93KBryH+8hodXCN+TmM1bk3+ot5/UVrE6If8N3k5q4
         kKzUO3sok/8DAdMUbrZigaFDJ961J6adLTTQvPhaRtUYzZdJJVo5aCX5EgZxbTOKx3Fz
         FBkoJb9mEqs3c+hI0u5oGLSiWSHjufXxMK4YU8JZaw2kN36saeCxjjVSauOISAb79o6f
         xCzxao+/HWkYcfyisEErEqq6KBzuRlhsnOqTho0vOutb8tkYTuFVs+wp6ExtiJFaiQE5
         hi48/Xa9waFqHIky5g8LMgf0TCHOMRhZodx7OY86znLi0FVnBaWlfYYk/weu6/A6r1dt
         sdFQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDzVdzaq4AeKLlqjwYJR6hPANE/E60AA9go1UoivwCArpUS77t0C
	GlCxFIx+1O7z5vsgDJOXRMM=
X-Google-Smtp-Source: ACHHUZ4a4h1gPNVFe+DzCxLczxXkh/BJ090/NPM4jrFDo/PbAd9ulqoCl5/5DgQhuUL6oyEVBpLtqw==
X-Received: by 2002:a05:622a:1ba2:b0:3ef:b4b5:7c99 with SMTP id bp34-20020a05622a1ba200b003efb4b57c99mr3938688qtb.11.1683510805493;
        Sun, 07 May 2023 18:53:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:6f09:0:b0:3ef:3784:2c24 with SMTP id bs9-20020ac86f09000000b003ef37842c24ls24113305qtb.2.-pod-prod-gmail;
 Sun, 07 May 2023 18:53:24 -0700 (PDT)
X-Received: by 2002:a05:622a:1baa:b0:3e6:4ff0:ef0a with SMTP id bp42-20020a05622a1baa00b003e64ff0ef0amr12263470qtb.20.1683510804652;
        Sun, 07 May 2023 18:53:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683510804; cv=none;
        d=google.com; s=arc-20160816;
        b=wYBiDF8SAl+diLAo+tZTjoT3jzNI5lsNGHlxJyIZYmtotyIjINDB7yZTKbJaFAgY78
         TvRwrE4KjWri4DiZqAw7kz+cXIesalMmMdg0D6+C6Modj6JZu+gCz3FIeTkcz9FhJzu/
         q0DX6qHANJACj8stYAZ06+2uOHnADvdA/AGO+oCMf+KztftHGVeQwzMesvnJOs5DvnEc
         6HdFtqyCl7x2lcfV7qAIVU1CjFW5hB1SIzBH70H1txvV2MPQzqY1AGXe2v1yS/NWq/zH
         1oGAg23/vXXDJ8nnZCWiPIJmUigA4d3lF+g3p4mgEEywmuMnlsopzW2Tr9IB/4AiXoav
         HWqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=BHyReJO2lH11Yc63ysxro8TBl+HeZGcgeVABy6tWHpQ=;
        b=ZiTHGt34BRgSgdobTRyxXbGSpm00/gP/zqy4j4pERFR2RmbwdU6ya2x/U0PzytG3m1
         Ey+zHy6PmjhN090Gl6G8BZtTcay+aMgOlWPLyPDFFVVybe3s+dXu7SgcZ4ctGJVkWnBb
         bX0vYbruhxgwdWTxOAUYuFywilwQm1n83l23JVszjRlpHPpIz5ConHbwb5twPL5eFs60
         eXmvfLGp1h1VZJAXNZE5HovReEAYqBgG4TE/y+YXJ+PII8abhu5pnfPtJVqkYlwuLqxx
         Hn8jI2i5fkrq803zaQVQ4/1foWgOxHx272o2SAdgYPvnLICdiQWt12cAUGVZjQ2v1nty
         DRWA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=lU4MgAy6;
       spf=pass (google.com: domain of kurtzou@gmail.com designates 2607:f8b0:4864:20::533 as permitted sender) smtp.mailfrom=kurtzou@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com. [2607:f8b0:4864:20::533])
        by gmr-mx.google.com with ESMTPS id h5-20020a05620a400500b0074d8a81f00csi404744qko.5.2023.05.07.18.53.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 May 2023 18:53:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of kurtzou@gmail.com designates 2607:f8b0:4864:20::533 as permitted sender) client-ip=2607:f8b0:4864:20::533;
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-5191796a483so2688771a12.0
        for <jailhouse-dev@googlegroups.com>; Sun, 07 May 2023 18:53:24 -0700 (PDT)
X-Received: by 2002:a17:903:1c2:b0:1a1:bede:5e4a with SMTP id
 e2-20020a17090301c200b001a1bede5e4amr11516730plh.49.1683510803389; Sun, 07
 May 2023 18:53:23 -0700 (PDT)
MIME-Version: 1.0
From: Kurt Zou <kurtzou@gmail.com>
Date: Sun, 7 May 2023 22:53:12 -0300
Message-ID: <CAC5TEnFx_TOr7ktks4qNSqL_bhv2P7r+fMOpbuz9B217jZNn5g@mail.gmail.com>
Subject: ARM: ivshmem virtual PCI device doesn't show up
To: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="0000000000006962c205fb24e765"
X-Original-Sender: KurtZou@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20221208 header.b=lU4MgAy6;       spf=pass
 (google.com: domain of kurtzou@gmail.com designates 2607:f8b0:4864:20::533 as
 permitted sender) smtp.mailfrom=kurtzou@gmail.com;       dmarc=pass (p=NONE
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

--0000000000006962c205fb24e765
Content-Type: text/plain; charset="UTF-8"

Hi All,
I'm trying to bring up a ivshmem net device on a cortex-A7 platform.

After enabling jailhouse, virtual PCI devices seem to be added
successfully, but with "lspci" or "/sys/bus/pci/devices", I didn't see
anything there. Am I missing something? I assume that pci devices (even
virtual) should be able to show up in system.

Here's the debug information:

root@demo:~# jailhouse enable /etc/jailhouse/demo.cell

Initializing Jailhouse hypervisor v0.12 on CPU 0
Code location: 0xf0000040
Page pool usage after early setup: mem 37/1770, remap 0/131072
Initializing processors:
 CPU 0... OK
 CPU 1... OK
 CPU 2... OK
 CPU 3... OK
Initializing unit: irqchip
Initializing unit: PCI
Adding virtual PCI device 00:00.0 to cell "demo"
Adding virtual PCI device 00:01.0 to cell "demo"
Page pool usage after late setup: mem 57/1770, remap 5/131072
Activating hypervisor
root@demo:~# lspci
root@demo:~# ifconfig
lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAC5TEnFx_TOr7ktks4qNSqL_bhv2P7r%2BfMOpbuz9B217jZNn5g%40mail.gmail.com.

--0000000000006962c205fb24e765
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div>I&#39;m trying to bring up a ivshmem net devic=
e on a cortex-A7 platform.</div><div><br></div><div>After enabling jailhous=
e, virtual PCI devices seem to be added successfully, but with &quot;lspci&=
quot; or &quot;/sys/bus/pci/devices&quot;, I didn&#39;t see anything there.=
 Am I missing something? I assume that pci devices (even virtual) should be=
 able to show up in system.</div><div><br></div><div>Here&#39;s the debug i=
nformation:</div><div><br></div><div>root@demo:~# jailhouse enable /etc/jai=
lhouse/demo.cell <br><br>Initializing Jailhouse hypervisor v0.12 on CPU 0<b=
r>Code location: 0xf0000040<br>Page pool usage after early setup: mem 37/17=
70, remap 0/131072<br>Initializing processors:<br>=C2=A0CPU 0... OK<br>=C2=
=A0CPU 1... OK<br>=C2=A0CPU 2... OK<br>=C2=A0CPU 3... OK<br>Initializing un=
it: irqchip<br>Initializing unit: PCI<br>Adding virtual PCI device 00:00.0 =
to cell &quot;demo&quot;<br>Adding virtual PCI device 00:01.0 to cell &quot=
;demo&quot;<br>Page pool usage after late setup: mem 57/1770, remap 5/13107=
2<br>Activating hypervisor<br>root@demo:~# lspci<br>root@demo:~# ifconfig<b=
r>lo: flags=3D73&lt;UP,LOOPBACK,RUNNING&gt; =C2=A0mtu 65536<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 inet 127.0.0.1 =C2=A0netmask 255.0.0.0<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 loop =C2=A0txqueuelen 1000 =C2=A0(Local Loopback)<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 RX packets 0 =C2=A0bytes 0 (0.0 B)<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 RX errors 0 =C2=A0dropped 0 =C2=A0overruns 0 =C2=A0frame 0<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets 0 =C2=A0bytes 0 (0.0 B)<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 TX errors 0 =C2=A0dropped 0 overruns 0 =C2=A0carrier 0=
 =C2=A0collisions 0<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAC5TEnFx_TOr7ktks4qNSqL_bhv2P7r%2BfMOpbuz9B217jZN=
n5g%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CAC5TEnFx_TOr7ktks4qNSqL_bhv2P7r%2BfMOpbu=
z9B217jZNn5g%40mail.gmail.com</a>.<br />

--0000000000006962c205fb24e765--
