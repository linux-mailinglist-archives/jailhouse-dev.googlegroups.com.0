Return-Path: <jailhouse-dev+bncBD7236HKXYJRBVP4T3YAKGQE2NNAXLY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33a.google.com (mail-ot1-x33a.google.com [IPv6:2607:f8b0:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB3312BF27
	for <lists+jailhouse-dev@lfdr.de>; Sat, 28 Dec 2019 21:43:02 +0100 (CET)
Received: by mail-ot1-x33a.google.com with SMTP id l13sf11765961otn.18
        for <lists+jailhouse-dev@lfdr.de>; Sat, 28 Dec 2019 12:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=HrhHuPLPQOtLpa7XQdgo4gmbxv0R597vDMRBL/1QO2I=;
        b=lphqVkcrSWkFRBMvW6PQ4WGhOiSIH6GUUcg2XDH1LMxhJv2BXB34DymSs19Ymy4TVj
         t4eOmrjigD2LvHQjxZDyhFROk2S9LK19MqWWn5qudovKExRsd8tDV3Q7EdUFMM0oGEOo
         FwU6G8k7YNKm+HZhgEQ7gyUUwlwN+RfkZgvFdpTCeVDObgyA1Ae+kdfFkZD9cSIpqNn1
         ICkSdBZSEQw7yYCsKJ/DRGWW2qgqMin82GTwWgnl3r9EzzJbYa4D/mTHm22F9PDFuQUZ
         93ethCy0b5RMVrfvNvmgMqJCmKO4nF3hJBfVdlfdOBEC+M09v/98RKcaLf+k9Sk+UMIF
         4O3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HrhHuPLPQOtLpa7XQdgo4gmbxv0R597vDMRBL/1QO2I=;
        b=GiRIkiPbLsFFHdSEw3ampCEWUhT1JYmLv5eHQOV4PCQ+tbRRJTYgta0hADlId4ZlHG
         khUQgPEb32uN21LuV3vXHkruugW8fvmh/kXxQ+x83ZBrusT7aQF+evK0KtFj0J4klEww
         1xJlXcLd3azX4PVuUq6FtmCZFDLQNTw9U/T5ATco/tyvuD9NIAZV1pvWGrA3O/IwHlX4
         IvT5jqayGxtKfqVvoXV6oIbPgh+u2TeShLfvACDMDXMK+EMuvzaiCiOna6cItVRU5Vat
         /5yy3hzJQYkqFTtHRLqFk/l9gr8H07dbBxk1RS9AssPdmwfvaDNiy2LFPoTWzduj8M8p
         trbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HrhHuPLPQOtLpa7XQdgo4gmbxv0R597vDMRBL/1QO2I=;
        b=s9hf6TcaL9jixKChG7oQWJz9Gb//VW8/WO6bz61ciL9Nv9QMbJkCURbb5Leike1+pV
         IAm+S6x8UaRW8fTzUTGFo+EACQZPO77grJTFQh8SnFnDD6HGG7yqMgMbBWWPKvoRWgqi
         S+Skdpq34fiiI8hpLRRyivgA5AfMMREil5UsbLPtrPFHUu+KJxYR8bANXcyJ6Rx5hs87
         T45h1OiWw/7EVz2vM9ZJ8+GMw7ZxgQ3FZ/43m8VLyB0YaxYT8KTR4XkznrHRCbMpnz7b
         /BNs/RVyFd+0j0t0LlBLPXoFzV5FbWICDxNPMb8uLF72FZMp4UZp3HAzgrC65cX4fcgl
         OboQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXF8LJ94Mzkc+lCviOkPkCexTjUJ8H8wMxI/+H46wUj4NVkky5v
	oYXwcbWI1WrzcvDZgMYAupQ=
X-Google-Smtp-Source: APXvYqwgnPADu4ncifSLEJbAVqyCleQs0SxViY20+zYFlI4B/J+/XiKOk6jaSq54ZRncKc2pVFrVbg==
X-Received: by 2002:a9d:2264:: with SMTP id o91mr65551433ota.328.1577565781250;
        Sat, 28 Dec 2019 12:43:01 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:611c:: with SMTP id i28ls9258004otj.3.gmail; Sat, 28 Dec
 2019 12:43:00 -0800 (PST)
X-Received: by 2002:a9d:21f4:: with SMTP id s107mr65006809otb.102.1577565780759;
        Sat, 28 Dec 2019 12:43:00 -0800 (PST)
Date: Sat, 28 Dec 2019 12:42:59 -0800 (PST)
From: contact.thorsten@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c6d8a14f-97c4-43f8-828d-679b08e14555@googlegroups.com>
Subject: [jailhouse-images] qemu examples stalls to enable with -EIO
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2209_1393955945.1577565779899"
X-Original-Sender: contact.thorsten@gmail.com
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

------=_Part_2209_1393955945.1577565779899
Content-Type: multipart/alternative; 
	boundary="----=_Part_2210_1314411100.1577565779900"

------=_Part_2210_1314411100.1577565779900
Content-Type: text/plain; charset="UTF-8"

Hej Jailhouse community,

after struggling waaay too long to get the really well prepared example 
from Jan working, I just want to post my intermediate work-around.

So, I am on a stock sid-Debian machine run by an Intel Core i5-6200U CPU 
(X260 Thinkpad). The preparation all went well, however hitting
jailhouse enable ...qemu-x86.cell 
JAILHOUSE_ENABLE: Input/output error

tracking it down (after creating  
echo "#define CONFIG_TRACE_ERROR   1" > 
./build/tmp/work/jailhouse-demo-amd64/jailhouse-jailhouse/0.11-r0/git/include/jailhouse/config.h
), as it was recommended in the FAQ,
I found that I ran into an odd feature mismatch at vmx.c:247, namely CPUID 
and read_msr(MSR_IA32_VMX_PROCBASED_CTLS2) had different opinions on the 
availability (0x101008) and usability (0x0378FF) of the XSAVES feature. No 
idea what it is related to, e.g. processor short coming or in use by the 
host-Linux (4.19.67-2+deb10u2), or ?? ...

However, "easy" fix was to disable the feature in ./start-qemu.sh by adding 
"-xsaves" to the line of "-cpu " features for qemu (QEMU emulator version 
4.2.0 (Debian 1:4.2-1)).

cheers,
Thorsten

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c6d8a14f-97c4-43f8-828d-679b08e14555%40googlegroups.com.

------=_Part_2210_1314411100.1577565779900
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hej Jailhouse community,</div><div><br></div><div>aft=
er struggling waaay too long to get the really well prepared example from J=
an working, I just want to post my intermediate work-around.</div><div><br>=
</div><div>So, I am on a stock sid-Debian machine run by an Intel Core i5-6=
200U CPU (X260 Thinkpad). The preparation all went well, however hitting</d=
iv><div>jailhouse enable ...qemu-x86.cell <br></div><div>JAILHOUSE_ENABLE: =
Input/output error</div><div><br></div><div>tracking it down (after creatin=
g=C2=A0 <br></div><div></div><div style=3D"margin-left: 40px;"><span style=
=3D"font-family: courier new, monospace;">echo &quot;#define CONFIG_TRACE_E=
RROR=C2=A0=C2=A0 1&quot; &gt; ./build/tmp/work/jailhouse-demo-amd64/jailhou=
se-jailhouse/0.11-r0/git/include/jailhouse/config.h</span></div><div></div>=
<div>), as it was recommended in the FAQ,<br></div><div> I found that I ran=
 into an odd feature mismatch at vmx.c:247, namely CPUID and read_msr(MSR_I=
A32_VMX_PROCBASED_CTLS2) had different opinions on the availability (0x1010=
08) and usability (0x0378FF) of the XSAVES feature. No idea what it is rela=
ted to, e.g. processor short coming or in use by the host-Linux (4.19.67-2+=
deb10u2), or ?? ...</div><div><br></div><div>However, &quot;easy&quot; fix =
was to disable the feature in ./start-qemu.sh by adding &quot;-xsaves&quot;=
 to the line of &quot;-cpu &quot; features for qemu (QEMU emulator version =
4.2.0 (Debian 1:4.2-1)).</div><div><br></div><div>cheers,<br>Thorsten</div>=
<div><br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/c6d8a14f-97c4-43f8-828d-679b08e14555%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/c6d8a14f-97c4-43f8-828d-679b08e14555%40googlegroups.com<=
/a>.<br />

------=_Part_2210_1314411100.1577565779900--

------=_Part_2209_1393955945.1577565779899--
