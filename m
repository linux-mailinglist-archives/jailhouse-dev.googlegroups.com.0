Return-Path: <jailhouse-dev+bncBDEJBXNQUEORBQWAZHXQKGQETXWHGPA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3e.google.com (mail-yb1-xb3e.google.com [IPv6:2607:f8b0:4864:20::b3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 5031211D13C
	for <lists+jailhouse-dev@lfdr.de>; Thu, 12 Dec 2019 16:44:04 +0100 (CET)
Received: by mail-yb1-xb3e.google.com with SMTP id g132sf1095604ybf.21
        for <lists+jailhouse-dev@lfdr.de>; Thu, 12 Dec 2019 07:44:04 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1576165443; cv=pass;
        d=google.com; s=arc-20160816;
        b=bcjyRf6sKHNsmzzWl3TC+35HQ2J6dJ14lArP2oXvKEIE4rFZbaxqIhXF2OrwFTeZrq
         2knlZ6Vn9AQVkP5EtzOydIc+TeyNZUtasp44pELvwj/H5TD/ygOKcnFwnNFmqfn4f79R
         Fl3ZyUMFNuMOysRDm647YcMi/XH1gwLkEhRyD30lXMZzzu0+wnUrZP4aehtn6KwOsNrX
         lU4giyKF+4YlN8qoxlWoECPlCPX8bcPfWK1U1qw6KTq3liMGFFjyYL1VLWH3vl6ZmXFU
         XTRk9MTC5T/blru8bjNNHVw0CoZxBbES5IQdq7hnWDhlw52Qeqb/Bq9UvipYkTjsg1zO
         VIoA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=ln63/GBTn+0R8gxJmvDXobnD9p33IBqW71fUoJCJKx4=;
        b=YFMK+BXRtBZnrcz5MM0K5EvALOX1aYJw/UpI+HiBdrBSkaWdc49WIZPj4tCdPP0UYv
         RCi2HXGoSfU4/woxP7wQ6Ba0Mko4sv25xUJ6yaahsb0/JNY5Uov+dg3r/WeeZm2RfWR7
         YWuo6XB/opj50aFj7EQaWQ7vWdEcofYB3qGvrLMTXeU4OlYs2AOsBuJYin6VmSysS886
         ZphF5bOpTYNpZugH8d16M8ikboM6CTMdEPYGMa6a/T1grOVxOp4JycJj0qPk+bYAfEWV
         9vozUFuWSojy5crnWG/ZzWcEpO6Hy3yn8/iJFBQIUDZUG4k3fYdZi8Ubdeckc2rMAHro
         V/MQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=HSdTOGfU;
       spf=pass (google.com: domain of guido.roncarolo@gmail.com designates 2607:f8b0:4864:20::32f as permitted sender) smtp.mailfrom=guido.roncarolo@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ln63/GBTn+0R8gxJmvDXobnD9p33IBqW71fUoJCJKx4=;
        b=Ls+sEdkHBNBdy/1Fv94x0ukaSkQQUHEwyvLTjyVdCTk3jgxAslyzke1BsvxoOJH+Jh
         1JYUlShp3pJ8+0CVP5yH/1yqOAYPttiUHYymojG9JcNscBQCVXJdPA3CSrKmD6n3MqQp
         wpdubr0BjRNvcg+rkDe7OA/6bLL7ayQ5ZRA/RBzLcdqxTZ6ENCj+VcvuWDsJDlqUudO3
         xiVCYQuGkYtsLSKm2EhNf5XNT8N0cbiU5IyefTFaXf1TJ0FbP0uzB98naOi9hvCUZCpX
         fwb5IFZ10rJdJy2XuwwmftZJcBMNsybLIlhZgVeUHk9nSshtyfKt+YVPBbOm0wdIRAm8
         xkLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ln63/GBTn+0R8gxJmvDXobnD9p33IBqW71fUoJCJKx4=;
        b=gP86CQ13QZ6YzuvHmh2ENbYbJ7NFEmwIRma0cCwBFN4sXrqWtbW5nZA1bxg1fKENVQ
         pf6LZXQOf36xsDebKICKY0svsrHcGUYH5TSenCX3GrS/tKRgU3IPNrEB7o9gif8gXP0W
         n2tA2r+oK7sqANJX9WRKnsYjWeT+PvXb2chhqdbzJfwtnK9VJ1bBRv337QGPPHj7d6O0
         Jvc71DXb5O+aP/HCy7Rvx0XUrP6BlmGnklEyS3ApM/SX9SaB6loy4Rh5TIhCooVxEs6Z
         PoA3wcT18NE7WRPV4qDrkBWFhrStkbAftIzLSbqG83Eu6csYaHbKtWvCfQ1USfWO5SRS
         H/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ln63/GBTn+0R8gxJmvDXobnD9p33IBqW71fUoJCJKx4=;
        b=PoZiipnM7Qcz+MKbmWNPRWPmbXr58V93DgLWbWRnIbtmJtEGmTPaUg3QvmbfmrCVCt
         lHAGZF+4+4r1zMYOZHFFslN3dPZuOJ4MzWWnOEQJBWHM7gZImFNjJQV3UPAkrIv49Bal
         WzHFe6rkdTzWK0uiJw4ilhblK2vSGz1ez2MsKZiN3G1R+1oMXGa8/FBolgaiRz5EtxRK
         y0P/azsDTS73Y+RzyQa668K9pZUxk03L0lFULjW12XQUIWU+k0+Ug62z2p7K2U94sTRM
         O12cTB55kotoKnRKbzkWXvHemAMIlOy5wt8VcE3dbGujysXoG/t8FPXgMGg/99NEOKpc
         QMGQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVLvgnD0HYwXj9apAdy2M3mHm2dr0id1A8MxTSEr1I+cT0pOisy
	m7bjUCIUg9Khc14GChi9yuM=
X-Google-Smtp-Source: APXvYqx0Hv8iu9qparJHxThQJTitCwJ+NZ5J8sTk1wi+IdjnO2UNuLOmIOO/TfKO+pyS08BDJ8uKjA==
X-Received: by 2002:a25:b183:: with SMTP id h3mr4618378ybj.141.1576165443009;
        Thu, 12 Dec 2019 07:44:03 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:d116:: with SMTP id i22ls935212ybg.9.gmail; Thu, 12 Dec
 2019 07:44:02 -0800 (PST)
X-Received: by 2002:a25:b21f:: with SMTP id i31mr4925477ybj.86.1576165442419;
        Thu, 12 Dec 2019 07:44:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576165442; cv=none;
        d=google.com; s=arc-20160816;
        b=S0MOQbyFr3NeS13Hf6dG1V2qBOukQoIIT4m/Mz6adPayl9EJatA2og88ypf6UX0K9v
         XaNscYGaHdgUeYIXjz2wC+SpVwXx5gyLE6Y46KpuqQSVkkgeYdmb/udFeabACsz7kyUp
         k1fooagMvnNu9gHEV08Bzx3hnQoKoSAeBvGGgjnDGfJQUG/VIbalqqasyxSc8qJjaDxj
         bU3FU5CAJEPDT9Z53aKxzI4JH7f2OZieRfYOdqEzORlZlPi2QdDrourvbVOFQuF1k7gw
         kb868NyNjgy7den9V5VtjtP9zJQJQ5H+Qqo24WnagwPhu756M2U1mjoTgRQY9Vq31i1d
         SBHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=27wCLet7mDsNbBsgyOI3RmqkX8zljEa7djrV2AWNTOs=;
        b=FHk/wam+r/XUNDBW2i2uK9b9zbAzIHG/ByDJG2AC02v+JtDLPKoATfiQrGVcacrmex
         2iGW8Jgf7Sm4Dopc+GI76vBZODMK8DSS2as0DowBoMJVBf1DveY1Wk6HRp83/FiD8bOc
         EPILJ4XaABhYYI0Cb9fiSKkU85PsGJc9bazQF8Ji0GKt3zP9vvytxKdm4t878Z+h6s6s
         69wUXukNhexcPJK+n2Ffw8mdCMmsadAWKwu/dRyZ6xUmo+fAF15lVD7XFJ6JM7sK3kmz
         vJVyVCwhcQzZFF6GE/Nv0RQFd0um9JGqUJ+xsJ5eC57XWtnDGgHcvXDyHOJTdP354jqs
         nRjA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=HSdTOGfU;
       spf=pass (google.com: domain of guido.roncarolo@gmail.com designates 2607:f8b0:4864:20::32f as permitted sender) smtp.mailfrom=guido.roncarolo@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com. [2607:f8b0:4864:20::32f])
        by gmr-mx.google.com with ESMTPS id j84si300956ywa.5.2019.12.12.07.44.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2019 07:44:02 -0800 (PST)
Received-SPF: pass (google.com: domain of guido.roncarolo@gmail.com designates 2607:f8b0:4864:20::32f as permitted sender) client-ip=2607:f8b0:4864:20::32f;
Received: by mail-ot1-x32f.google.com with SMTP id o9so2436511ote.2
        for <jailhouse-dev@googlegroups.com>; Thu, 12 Dec 2019 07:44:02 -0800 (PST)
X-Received: by 2002:a05:6830:12cc:: with SMTP id a12mr8018012otq.73.1576165440972;
 Thu, 12 Dec 2019 07:44:00 -0800 (PST)
MIME-Version: 1.0
References: <AM0PR04MB71223156702DE74066C2511BE2550@AM0PR04MB7122.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB71223156702DE74066C2511BE2550@AM0PR04MB7122.eurprd04.prod.outlook.com>
From: Guido Roncarolo <guido.roncarolo@gmail.com>
Date: Thu, 12 Dec 2019 16:43:49 +0100
Message-ID: <CADVdfxh4=ZmDpzHHh1H+8Kucb3bDDaaOjpjJRkz3cxzYvMVXBw@mail.gmail.com>
Subject: Adding a shared tracing mechanism
To: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="000000000000376b1b0599839d51"
X-Original-Sender: guido.roncarolo@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=HSdTOGfU;       spf=pass
 (google.com: domain of guido.roncarolo@gmail.com designates
 2607:f8b0:4864:20::32f as permitted sender) smtp.mailfrom=guido.roncarolo@gmail.com;
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

--000000000000376b1b0599839d51
Content-Type: text/plain; charset="UTF-8"

Hello All,

I am trying to add a small tracing mechanism developed for a RTOS inside
jailhouse.
It is a simple circular buffer where in constant time access you can insert
events, then from Linux
you can dump the shared memory and translate the circular buffer content
into babletrace format

To achieve this I
1) added a memory region inside the cell config
2) initialize the tracer struct in init_early() hypervisor/setup.c
3) try to insert a test event -> OK
3.1) dump mem from linux -> OK record is there
4) try to insert an event inside  entry()  or after -> NOT good


FATAL: Unhandled HYP exception: synchronous abort from EL2
 pc: 0000ffffc020bf68   lr: 0000ffffc02024d4 spsr: 800003c9     EL2
 sp: 0000ff0000010e90  esr: 25 1 0000006
 x0: 000000000000002b   x1: 000000000000001e   x2: 0000ffffc021d000
 x3: 00000000b7e00000   x4: 0000ffffc021d030   x5: 0000000000000000
 x6: 0000000000000000   x7: 0000000000000000   x8: 0000000000000000
 x9: 0000000000000000  x10: 0000000000000000  x11: 0000000000000000
x12: 0000000000000000  x13: 0000000000000000  x14: 0000000000000000
x15: 0000000000000000  x16: 0000000000000000  x17: 0000000000000000
x18: 0000000000000000  x19: 000000000000001e  x20: 0000ffffc0219038
x21: 0000000000000001  x22: 0000000000000001  x23: 0000000000000002
x24: ffff00000969c000  x25: ffff000008010000  x26: ffff000008014000
x27: 0000000000000000  x28: ffff8000283ea880  x29: 0000ff0000010e90


I tried to to understand from memory-layout.txt if sharing memory
like this is legal: what I would need a "Common memory region"
that stays visible to all contexts but I'm unsure if this is feasible or
allowed

Thank you in advance

Best Regards

guido

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CADVdfxh4%3DZmDpzHHh1H%2B8Kucb3bDDaaOjpjJRkz3cxzYvMVXBw%40mail.gmail.com.

--000000000000376b1b0599839d51
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" =
class=3D"gmail_attr"><span style=3D"font-family:Calibri,Arial,Helvetica,san=
s-serif;font-size:10pt">Hello All,</span><br></div><div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:10pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:10pt=
;color:rgb(0,0,0)">
I am trying to add a small tracing mechanism developed for a RTOS inside ja=
ilhouse.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:10pt=
;color:rgb(0,0,0)">
It is a simple circular buffer where in constant time access you can insert=
 events, then from Linux
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:10pt=
;color:rgb(0,0,0)">
you can dump the shared memory and translate the circular buffer content in=
to babletrace format<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:10pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:10pt=
;color:rgb(0,0,0)">
To achieve this I</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:10pt=
;color:rgb(0,0,0)">
1) added a memory region inside the cell config</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:10pt=
;color:rgb(0,0,0)">
2) initialize the tracer struct in init_early() hypervisor/setup.c</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:10pt=
;color:rgb(0,0,0)">
3) try to insert a test event -&gt; OK</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:10pt=
;color:rgb(0,0,0)">
3.1) dump mem from linux -&gt; OK record is there<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:10pt=
;color:rgb(0,0,0)">
4) try to insert an event inside=C2=A0 entry()=C2=A0 or after -&gt; NOT goo=
d<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:10pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:10pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:10pt=
;color:rgb(0,0,0)">
<span>FATAL: Unhandled HYP exception: synchronous abort from EL2<br>
</span>
<div>=C2=A0pc: 0000ffffc020bf68 =C2=A0 lr: 0000ffffc02024d4 spsr: 800003c9 =
=C2=A0 =C2=A0 EL2<br>
</div>
<div>=C2=A0sp: 0000ff0000010e90 =C2=A0esr: 25 1 0000006<br>
</div>
<div>=C2=A0x0: 000000000000002b =C2=A0 x1: 000000000000001e =C2=A0 x2: 0000=
ffffc021d000<br>
</div>
<div>=C2=A0x3: 00000000b7e00000 =C2=A0 x4: 0000ffffc021d030 =C2=A0 x5: 0000=
000000000000<br>
</div>
<div>=C2=A0x6: 0000000000000000 =C2=A0 x7: 0000000000000000 =C2=A0 x8: 0000=
000000000000<br>
</div>
<div>=C2=A0x9: 0000000000000000 =C2=A0x10: 0000000000000000 =C2=A0x11: 0000=
000000000000<br>
</div>
<div>x12: 0000000000000000 =C2=A0x13: 0000000000000000 =C2=A0x14: 000000000=
0000000<br>
</div>
<div>x15: 0000000000000000 =C2=A0x16: 0000000000000000 =C2=A0x17: 000000000=
0000000<br>
</div>
<div>x18: 0000000000000000 =C2=A0x19: 000000000000001e =C2=A0x20: 0000ffffc=
0219038<br>
</div>
<div>x21: 0000000000000001 =C2=A0x22: 0000000000000001 =C2=A0x23: 000000000=
0000002<br>
</div>
<div>x24: ffff00000969c000 =C2=A0x25: ffff000008010000 =C2=A0x26: ffff00000=
8014000<br>
</div>
<div>x27: 0000000000000000 =C2=A0x28: ffff8000283ea880 =C2=A0x29: 0000ff000=
0010e90<br>
</div>
<span></span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:10pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:10pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:10pt=
;color:rgb(0,0,0)">
I tried to to understand from memory-layout.txt if sharing memory <br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:10pt=
;color:rgb(0,0,0)">
like this is legal:<span> what I would need a &quot;Common memory region&qu=
ot; <br>
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:10pt=
;color:rgb(0,0,0)">
<span>that stays visible to all contexts but I&#39;m unsure if this is feas=
ible or allowed
<br>
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:10pt=
;color:rgb(0,0,0)">
<span><br>
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:10pt=
;color:rgb(0,0,0)">
<span>Thank you in advance<br>
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:10pt=
;color:rgb(0,0,0)">
<span><br>
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:10pt=
;color:rgb(0,0,0)">
<span>Best Regards</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:10pt=
;color:rgb(0,0,0)">
<span><br>
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:10pt=
;color:rgb(0,0,0)">
<span>guido<br>
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:10pt=
;color:rgb(0,0,0)">
<br>
<span></span><span></span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:10pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:10pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:10pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:10pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:10pt=
;color:rgb(0,0,0)">
<br>
</div>
</div>

</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CADVdfxh4%3DZmDpzHHh1H%2B8Kucb3bDDaaOjpjJRkz3cxzYv=
MVXBw%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://grou=
ps.google.com/d/msgid/jailhouse-dev/CADVdfxh4%3DZmDpzHHh1H%2B8Kucb3bDDaaOjp=
jJRkz3cxzYvMVXBw%40mail.gmail.com</a>.<br />

--000000000000376b1b0599839d51--
