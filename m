Return-Path: <jailhouse-dev+bncBCZKXDNMZALBBMPASXUQKGQE64QAU6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd3c.google.com (mail-io1-xd3c.google.com [IPv6:2607:f8b0:4864:20::d3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC536402E
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Jul 2019 06:57:23 +0200 (CEST)
Received: by mail-io1-xd3c.google.com with SMTP id k21sf1499842ioj.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jul 2019 21:57:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562734642; cv=pass;
        d=google.com; s=arc-20160816;
        b=Jux/hZwOmb7LvpLS6vjP4duk2Umu/+V/o7WSJaNv0v5PYLUA/P/6kBwDMLQEo3Gsub
         LTGSNoIXzis2pdXrxuws67vyByeQs6NH22PT7QgdsiGG8PEgsYMe0eiCAvj4hserAFyI
         u676aXkBMALT9Dn05gN1Y1cIFhYqPT566vmCLM1OUdw6mEhyyW1G5PSw3090yqsG0+DR
         9il9BwM+0Rw1c2H+5YWiV4M800MdMgEu9s0OY/SljJSw1C4iba4qVBgoo/fwesbMMi80
         zIOxKHNzGsBkpYzVE5NavhZ3rz7brFFpvJ04kvRZ+1cL/YI63khU3dZUjJhrK/HCpSSp
         fqpg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=d7t/qRkfHxRw9D5RGpZed8AaVjw8cZIYwdnx+nQIob8=;
        b=sGYmZZ/uvKLg9JI53pnrH/VgkwM89CqJjFWn5rdz4ZrsdrmIyMmQlBWfa+XvH3w8ny
         R1E8j7CrCY9INWGfv+VRolk+xvDqJj5DzeMsC47riGjMvHeiclCsMFCaMn43FSDZd08o
         uMA3/GbeUxurceex1nMifSaPBMxlNkHT7IpAyFqxOK1XOdnQB9N7Nh2EQil2f+e1fKbb
         O9A2RmMpVxUEiCNCrjEfruXbgAxo8WN8mMUSti7VK8wYKoOcdBh0KMwVXu4xsfDVdEF+
         EKRaWCFNnd88CQpYw63fmBJQDLIAu540MTG2QdEm0WA23y1/ZTGG82xc8ZmWfa3ByWb0
         MgEw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=oS4f+7XN;
       spf=pass (google.com: domain of alexlargacha@gmail.com designates 2607:f8b0:4864:20::b32 as permitted sender) smtp.mailfrom=alexlargacha@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=d7t/qRkfHxRw9D5RGpZed8AaVjw8cZIYwdnx+nQIob8=;
        b=Uu1JPIUAlwsR3wmoKSmiSchGULPjrrPuIKB3xRQnvAYW+J0E2K2JJbr+ezNIZgyehr
         5ylkO/RLg3j4nG0INgT9fwuhKJNoDA4kUvvZFO/jRXrAweWW4AP36GpxRVd3ONg+Po2S
         GESO4KcDX9XVx9m+ZKbRmejWDX8zOlSXvhh+jiNMwHQ+F2blivruiVZHT8FN3NA12Yr8
         Y8QPwQ0tVIbEUzLx6NhD4v2QAyatHJZmlQQPtFpp/TZl/9hwG8+R0VEYpG0pC4GKTXkD
         HpNIkehQOZvImMnOpu+TLHaBh2SThkTIuAH5KZsJnj9/O+s9Er8/5DCEdVpe7bttAK3V
         iX3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=d7t/qRkfHxRw9D5RGpZed8AaVjw8cZIYwdnx+nQIob8=;
        b=FglMwYn4+ojFWeGc9UVuaQUNHfxUhZAnsIQA7PUq9S4shtPcZzcOweKxv5FH886zzu
         HKzoW+F5SvlxV09/z1JDu8tF2Tx8HrxUOHL0JGOM/Jm0RcjhwRvf7WjxF56DyKNR+DLP
         e3zQyh15hKxiJ5alefQkgomqzNb1o5wfdBMM3ihh4o97mBKgymGciOcI8u/nJbCgOV9T
         zV3mgvH6bbOPl6RTalV6rsqlV+9jX5EuK6FZx3wVtkM+Lt35/F8hNM8WoxaYcHPPyWNn
         VQ4JVNaFv+4r12TuxS6s6xK8lAtq/dGGxRJI86F7ld+UJ3TD3sb7H2Hmg7L1K9WboihD
         ZOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=d7t/qRkfHxRw9D5RGpZed8AaVjw8cZIYwdnx+nQIob8=;
        b=E+iIiTnhrzNiy4S1whp5afofFfzwFOM18TJ5xWzi1pujzHIXF+veNzkQdgkZZhY7Im
         Gzndk5JAPQOJ6ZcY9rTG+QfQSajJVZcAsB86Zb+zhpvzTlHld4URVflqt5bBA3QsYybk
         2hlRk6p00r2gRfUIxGPmuhy8vdfqtLF7LKldHvX5rWqpun17UYfSODXMpVpcIL1afsWQ
         qwi4eTZQGtgNrHrhmIfGHuBp61FUwYE5n13/0OKA8W2dRdf1RZSkZJf0nhq4RYXmUIsC
         O44VFEEM7bvFfIw8YvD2OV+OrztvqG+Aw/5TDhlMAcQL3tXzZfd7hHutNIOc1pV2eQ6K
         xA/w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWeZ3dChwOE5Mj681Z21eLQ8WbNeD+PlNmuK0F8GBxDdMPJu8Kw
	ilhSOXjrs/Xdx8/uA5L6w9M=
X-Google-Smtp-Source: APXvYqx8WdO/E6vUp5caS2WT9IuU1GnLHTq2yvT38CeZBIRkKIzX5RblsqxyTAOZrVh/LxA4/bvbSg==
X-Received: by 2002:a02:9004:: with SMTP id w4mr33413103jaf.111.1562734641919;
        Tue, 09 Jul 2019 21:57:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a6b:d018:: with SMTP id x24ls292676ioa.6.gmail; Tue, 09 Jul
 2019 21:57:21 -0700 (PDT)
X-Received: by 2002:a5d:9ec4:: with SMTP id a4mr28503950ioe.125.1562734641376;
        Tue, 09 Jul 2019 21:57:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562734641; cv=none;
        d=google.com; s=arc-20160816;
        b=x1NAUgblXmglqh+P79FIXaTGMhwvpv8x1ir+K9ZLhzNSrfAc9NKhjKi8cEpqfLJ94E
         Uxffgmm/vOwkmUyO3fKu/JQtQwVRC8EO9xRALqHQMI6e4ggbH9YRTKvZCGLU2g1EI7HH
         Ou2QoyRipAIrPiI9ohSKTL2nCTiaQ8oORW1YVvz2UkaPDwgnFDO1i8SajS842Zd8yFDv
         vy3CLZeKshEOX4D5NoHTZjvYnrcFp0GYQX6tjhlu2Cpd1f/+WrHEzrYaIQ2qHzQy4wHq
         gUp1u9vFYSlDmUGgMWXw61+gAwNmWsIaeoDMJjBXJd6q4D00IWcMxrf+TSo2MmNAVAdl
         fZWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=RxcajWEV6QQpN747CTezasd42guX5DRJb4HtV+OiCTI=;
        b=hSBRs6OP/aQJD0IJmcycfVCC15GjRi9+SK9RpF98S6l3IaSPXcwB/A7efZ896tPvI9
         grRtVHVrl9Kd0iNx9l68ytZP+lwc27VBE27ypwKrd51WUbTclQObrFMdJsgNhXlQ4Ynj
         ziU7s0MGF1h9rWA/NmT4fR6fVUlJia7lbjx80a9wGgiu29oHEe/NBc3n7qvKQhLDxrgb
         7aSFzLGBDRysuZE7B87TFpHVT62kPe1m5C0tfs9gzymAClo2MvnFGgIFKBNoPniv46KJ
         S/iQN3qw0mgxf7Vy3hTnHJ0SmyzViObUMLY76M9YbegA3QJS1OAbxBDTvO/i6YfZP97u
         7BIQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=oS4f+7XN;
       spf=pass (google.com: domain of alexlargacha@gmail.com designates 2607:f8b0:4864:20::b32 as permitted sender) smtp.mailfrom=alexlargacha@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com. [2607:f8b0:4864:20::b32])
        by gmr-mx.google.com with ESMTPS id m3si57943ioc.4.2019.07.09.21.57.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 21:57:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of alexlargacha@gmail.com designates 2607:f8b0:4864:20::b32 as permitted sender) client-ip=2607:f8b0:4864:20::b32;
Received: by mail-yb1-xb32.google.com with SMTP id x4so363863ybk.0
        for <jailhouse-dev@googlegroups.com>; Tue, 09 Jul 2019 21:57:21 -0700 (PDT)
X-Received: by 2002:a25:5010:: with SMTP id e16mr15421080ybb.296.1562734640807;
 Tue, 09 Jul 2019 21:57:20 -0700 (PDT)
MIME-Version: 1.0
From: Alejandro Largacha <alexlargacha@gmail.com>
Date: Wed, 10 Jul 2019 06:57:09 +0200
Message-ID: <CANdaEOi5f13kg0OF+6iYrzmoJUTOhtgu4=r+0Vt+ZQ4oTtf1DQ@mail.gmail.com>
Subject: PL interrupt in UltraZed
To: jailhouse-dev@googlegroups.com
Content-Type: multipart/mixed; boundary="00000000000024eb87058d4c83c4"
X-Original-Sender: alexlargacha@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=oS4f+7XN;       spf=pass
 (google.com: domain of alexlargacha@gmail.com designates 2607:f8b0:4864:20::b32
 as permitted sender) smtp.mailfrom=alexlargacha@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--00000000000024eb87058d4c83c4
Content-Type: multipart/alternative; boundary="00000000000024eb83058d4c83c2"

--00000000000024eb83058d4c83c2
Content-Type: text/plain; charset="UTF-8"

Hello,

I have been paying with jailhouse in a UltraZed SoM with AES-ZU-IOCC-G
carrier card from avnet.
So far, I have been able to enable the root cell, create a aremetal cell
where I was able to load the baremetal
examples like gic-demo and a custom one where I was able to turn on some
leds via axi gpio in PL side.

Now I'm trying to run an example where I can catch the interrupt from an
axi gpio in PL and I am not able to do that.
I'm using PL to PS interrupts in my design and the signal is being
generated. I also tested with Xilinx SDK.
I tried with PS to PL group 0 and group 1. Irq numbers 121 and 136 and no
success. I don't know what I'm missing.
I attach the cells and the demo source.

Any help would be appreciated.
Thanks in advance.

Alex

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CANdaEOi5f13kg0OF%2B6iYrzmoJUTOhtgu4%3Dr%2B0Vt%2BZQ4oTtf1DQ%40mail.gmail.com.
For more options, visit https://groups.google.com/d/optout.

--00000000000024eb83058d4c83c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>I have been paying wi=
th jailhouse in a UltraZed SoM with AES-ZU-IOCC-G carrier card from avnet. =
<br></div><div>So far, I have been able to enable the root cell, create a a=
remetal cell where I was able to load the baremetal</div><div>examples like=
 gic-demo and a custom one where I was able to turn on some leds via axi gp=
io in PL side.</div><div><br></div><div>Now I&#39;m trying to run an exampl=
e where I can catch the interrupt from an axi gpio in PL and I am not able =
to do that.</div><div>I&#39;m using PL to PS interrupts in my design and th=
e signal is being generated. I also tested with Xilinx SDK.</div><div>I tri=
ed with PS to PL group 0 and group 1. Irq numbers 121 and 136 and no succes=
s. I don&#39;t know what I&#39;m missing.</div><div>I attach the cells and =
the demo source.</div><div><br></div><div>Any help would be appreciated.</d=
iv><div>Thanks in advance.</div><div><br></div><div>Alex<br></div><div><br>=
</div><div><br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CANdaEOi5f13kg0OF%2B6iYrzmoJUTOhtgu4%3Dr%2B0Vt%2BZ=
Q4oTtf1DQ%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://=
groups.google.com/d/msgid/jailhouse-dev/CANdaEOi5f13kg0OF%2B6iYrzmoJUTOhtgu=
4%3Dr%2B0Vt%2BZQ4oTtf1DQ%40mail.gmail.com</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--00000000000024eb83058d4c83c2--
--00000000000024eb87058d4c83c4
Content-Type: text/x-csrc; charset="US-ASCII"; name="ultrazed_ehu_leds.c"
Content-Disposition: attachment; filename="ultrazed_ehu_leds.c"
Content-Transfer-Encoding: base64
Content-ID: <f_jxwrrin11>
X-Attachment-Id: f_jxwrrin11

LyoKICogSmFpbGhvdXNlLCBhIExpbnV4LWJhc2VkIHBhcnRpdGlvbmluZyBoeXBlcnZpc29yCiAq
CiAqIENvbmZpZ3VyYXRpb24gZm9yIGdpYy1kZW1vIGlubWF0ZSBvbiBYaWxpbnggWnlucU1QIFpD
VTEwMiBldmFsIGJvYXJkOgogKiAxIENQVSwgNjRLIFJBTSwgMSBzZXJpYWwgcG9ydAogKgogKiBD
b3B5cmlnaHQgKGMpIFNpZW1lbnMgQUcsIDIwMTYKICoKICogQXV0aG9yczoKICogIEphbiBLaXN6
a2EgPGphbi5raXN6a2FAc2llbWVucy5jb20+CiAqCiAqIFRoaXMgd29yayBpcyBsaWNlbnNlZCB1
bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHUEwsIHZlcnNpb24gMi4gIFNlZQogKiB0aGUgQ09Q
WUlORyBmaWxlIGluIHRoZSB0b3AtbGV2ZWwgZGlyZWN0b3J5LgogKi8KCiNpbmNsdWRlIDxqYWls
aG91c2UvdHlwZXMuaD4KI2luY2x1ZGUgPGphaWxob3VzZS9jZWxsLWNvbmZpZy5oPgoKc3RydWN0
IHsKCXN0cnVjdCBqYWlsaG91c2VfY2VsbF9kZXNjIGNlbGw7CglfX3U2NCBjcHVzWzFdOwoJc3Ry
dWN0IGphaWxob3VzZV9tZW1vcnkgbWVtX3JlZ2lvbnNbNV07Cn0gX19hdHRyaWJ1dGVfXygocGFj
a2VkKSkgY29uZmlnID0gewoJLmNlbGwgPSB7CgkJLnNpZ25hdHVyZSA9IEpBSUxIT1VTRV9DRUxM
X0RFU0NfU0lHTkFUVVJFLAoJCS5yZXZpc2lvbiA9IEpBSUxIT1VTRV9DT05GSUdfUkVWSVNJT04s
CgkJLm5hbWUgPSAiZ3Bpby1sZWRzLWRlbW8iLAoJCS5mbGFncyA9IEpBSUxIT1VTRV9DRUxMX1BB
U1NJVkVfQ09NTVJFRywKCgkJLmNwdV9zZXRfc2l6ZSA9IHNpemVvZihjb25maWcuY3B1cyksCgkJ
Lm51bV9tZW1vcnlfcmVnaW9ucyA9IEFSUkFZX1NJWkUoY29uZmlnLm1lbV9yZWdpb25zKSwKCQku
bnVtX2lycWNoaXBzID0gMCwKCQkucGlvX2JpdG1hcF9zaXplID0gMCwKCQkubnVtX3BjaV9kZXZp
Y2VzID0gMCwKCgkJLmNvbnNvbGUgPSB7CgkJCS5hZGRyZXNzID0gMHhmZjAxMDAwMCwKCQkJLnR5
cGUgPSBKQUlMSE9VU0VfQ09OX1RZUEVfWFVBUlRQUywKCQkJLmZsYWdzID0gSkFJTEhPVVNFX0NP
Tl9BQ0NFU1NfTU1JTyB8CgkJCQkgSkFJTEhPVVNFX0NPTl9SRUdESVNUXzQsCgkJfSwKCX0sCgoJ
LmNwdXMgPSB7CgkJMHg4LAoJfSwKCgkubWVtX3JlZ2lvbnMgPSB7CgkJLyogVUFSVCAqLyB7CgkJ
CS5waHlzX3N0YXJ0ID0gMHhmZjAxMDAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweGZmMDEwMDAwLAoJ
CQkuc2l6ZSA9IDB4MTAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhP
VVNFX01FTV9XUklURSB8CgkJCQlKQUlMSE9VU0VfTUVNX0lPIHwgSkFJTEhPVVNFX01FTV9ST09U
U0hBUkVELAoJCX0sCgkJLyogUkFNICovIHsKCQkJLnBoeXNfc3RhcnQgPSAweDQyMDAwMDAwLAoJ
CQkudmlydF9zdGFydCA9IDAsCgkJCS5zaXplID0gMHgwMDAxMDAwMCwKCQkJLmZsYWdzID0gSkFJ
TEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSB8CgkJCQlKQUlMSE9VU0VfTUVN
X0VYRUNVVEUgfCBKQUlMSE9VU0VfTUVNX0xPQURBQkxFLAoJCX0sCgkJLyogR1BJT19TV0lUQ0hF
UyAqLyB7CgkJCS5waHlzX3N0YXJ0ID0gMHg4MDAwMDAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweDgw
MDAwMDAwLAoJCQkuc2l6ZSA9IDB4MDAwMDEwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1f
UkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUgfAoJCQkJSkFJTEhPVVNFX01FTV9JTyB8IEpBSUxI
T1VTRV9NRU1fUk9PVFNIQVJFRCwKCQl9LAoJCS8qIEdQSU9fTEVEUyAqLyB7CgkJCS5waHlzX3N0
YXJ0ID0gMHg4MDAwMTAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweDgwMDAxMDAwLAoJCQkuc2l6ZSA9
IDB4MDAwMDEwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9N
RU1fV1JJVEUgfAoJCQkJSkFJTEhPVVNFX01FTV9JTyB8IEpBSUxIT1VTRV9NRU1fUk9PVFNIQVJF
RCwKCQl9LAoJCS8qIGNvbW11bmljYXRpb24gcmVnaW9uICovIHsKCQkJLnZpcnRfc3RhcnQgPSAw
eDgwMDAwMDAwLAoJCQkuc2l6ZSA9IDB4MDAwMDEwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9N
RU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUgfAoJCQkJSkFJTEhPVVNFX01FTV9DT01NX1JF
R0lPTiwKCQl9LAoJfQp9Owo=
--00000000000024eb87058d4c83c4
Content-Type: text/x-csrc; charset="US-ASCII"; name="ultrazed_ehu.c"
Content-Disposition: attachment; filename="ultrazed_ehu.c"
Content-Transfer-Encoding: base64
Content-ID: <f_jxwrrim40>
X-Attachment-Id: f_jxwrrim40

LyoKICogSmFpbGhvdXNlLCBhIExpbnV4LWJhc2VkIHBhcnRpdGlvbmluZyBoeXBlcnZpc29yCiAq
CiAqIENvbmZpZ3VyYXRpb24gZm9yIFhpbGlueCBaeW5xTVAgWkNVMTAyIGV2YWwgYm9hcmQKICoK
ICogQ29weXJpZ2h0IChjKSBTaWVtZW5zIEFHLCAyMDE2CiAqCiAqIEF1dGhvcnM6CiAqICBKYW4g
S2lzemthIDxqYW4ua2lzemthQHNpZW1lbnMuY29tPgogKgogKiBUaGlzIHdvcmsgaXMgbGljZW5z
ZWQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR1BMLCB2ZXJzaW9uIDIuICBTZWUKICogdGhl
IENPUFlJTkcgZmlsZSBpbiB0aGUgdG9wLWxldmVsIGRpcmVjdG9yeS4KICoKICogUmVzZXJ2YXRp
b24gdmlhIGRldmljZSB0cmVlOiAweDgwMDAwMDAwMC4uMHg4M2ZmZmZmZmYKICovCgojaW5jbHVk
ZSA8amFpbGhvdXNlL3R5cGVzLmg+CiNpbmNsdWRlIDxqYWlsaG91c2UvY2VsbC1jb25maWcuaD4K
Ci8vI2RlZmluZSBBUlJBWV9TSVpFKGEpIChzaXplb2YoYSkgLyBzaXplb2YoYVswXSkpCgpzdHJ1
Y3QgewoJc3RydWN0IGphaWxob3VzZV9zeXN0ZW0gaGVhZGVyOwoJX191NjQgY3B1c1sxXTsKCXN0
cnVjdCBqYWlsaG91c2VfbWVtb3J5IG1lbV9yZWdpb25zWzhdOwoJc3RydWN0IGphaWxob3VzZV9p
cnFjaGlwIGlycWNoaXBzWzFdOwp9IF9fYXR0cmlidXRlX18oKHBhY2tlZCkpIGNvbmZpZyA9IHsK
CS5oZWFkZXIgPSB7CgkJLnNpZ25hdHVyZSA9IEpBSUxIT1VTRV9TWVNURU1fU0lHTkFUVVJFLAoJ
CS5yZXZpc2lvbiA9IEpBSUxIT1VTRV9DT05GSUdfUkVWSVNJT04sCgkJLmZsYWdzID0gSkFJTEhP
VVNFX1NZU19WSVJUVUFMX0RFQlVHX0NPTlNPTEUsCgkJLmh5cGVydmlzb3JfbWVtb3J5ID0gewoJ
CQkucGh5c19zdGFydCA9IDB4NDAwMDAwMDAsCgkJCS5zaXplID0gICAgICAgMHgwMTAwMDAwMCwK
CQl9LAoJCS5kZWJ1Z19jb25zb2xlID0gewoJCQkuYWRkcmVzcyA9IDB4ZmYwMDAwMDAsCgkJCS5z
aXplID0gMHgxMDAwLAoJCQkudHlwZSA9IEpBSUxIT1VTRV9DT05fVFlQRV9YVUFSVFBTLAoJCQku
ZmxhZ3MgPSBKQUlMSE9VU0VfQ09OX0FDQ0VTU19NTUlPIHwKCQkJCSBKQUlMSE9VU0VfQ09OX1JF
R0RJU1RfNCwKCQl9LAoJCS5wbGF0Zm9ybV9pbmZvID0gewoJCQkucGNpX21tY29uZmlnX2Jhc2Ug
PSAweGZjMDAwMDAwLAoJCQkucGNpX21tY29uZmlnX2VuZF9idXMgPSAwLAoJCQkucGNpX2lzX3Zp
cnR1YWwgPSAxLAoJCQkucGNpX2RvbWFpbiA9IC0xLAoJCQkuYXJtID0gewoJCQkJLmdpY192ZXJz
aW9uID0gMiwKCQkJCS5naWNkX2Jhc2UgPSAweGY5MDEwMDAwLAoJCQkJLmdpY2NfYmFzZSA9IDB4
ZjkwMmYwMDAsCgkJCQkuZ2ljaF9iYXNlID0gMHhmOTA0MDAwMCwKCQkJCS5naWN2X2Jhc2UgPSAw
eGY5MDZmMDAwLAoJCQkJLm1haW50ZW5hbmNlX2lycSA9IDI1LAoJCQl9LAoJCX0sCgkJLnJvb3Rf
Y2VsbCA9IHsKCQkJLm5hbWUgPSAiVWx0cmFaZWQgU29NIGVodSIsCgoJCQkuY3B1X3NldF9zaXpl
ID0gc2l6ZW9mKGNvbmZpZy5jcHVzKSwKCQkJLm51bV9tZW1vcnlfcmVnaW9ucyA9IEFSUkFZX1NJ
WkUoY29uZmlnLm1lbV9yZWdpb25zKSwKCQkJLm51bV9pcnFjaGlwcyA9IEFSUkFZX1NJWkUoY29u
ZmlnLmlycWNoaXBzKSwKCQkJLnZwY2lfaXJxX2Jhc2UgPSAxMzYtMzIsCgkJfSwKCX0sCgoJLmNw
dXMgPSB7CgkJMHhmLAoJfSwKCgkubWVtX3JlZ2lvbnMgPSB7CgkJLyogTU1JTyAocGVybWlzc2l2
ZSkgKi8gewoJCQkucGh5c19zdGFydCA9IDB4ZmQwMDAwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHhm
ZDAwMDAwMCwKCQkJLnNpemUgPQkgICAgICAweDAzMDAwMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9V
U0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFIHwKCQkJCUpBSUxIT1VTRV9NRU1fSU8s
CgkJfSwKCQkvKiBSQU0gKi8gewoJCQkucGh5c19zdGFydCA9IDB4MCwKCQkJLnZpcnRfc3RhcnQg
PSAweDAsCgkJCS5zaXplID0gMHg0MDAwMDAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9S
RUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSB8CgkJCQlKQUlMSE9VU0VfTUVNX0VYRUNVVEUsCgkJ
fSwKCQkvKiBSQU0gKi8gewoJCQkucGh5c19zdGFydCA9IDB4NDIwMDAwMDAsCgkJCS52aXJ0X3N0
YXJ0ID0gMHg0MjAwMDAwMCwKCQkJLnNpemUgPSAweDNlMDAwMDAwLAoJCQkuZmxhZ3MgPSBKQUlM
SE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFIHwKCQkJCUpBSUxIT1VTRV9NRU1f
RVhFQ1VURSwKCQl9LAoJCS8qIFBMIGdwaW8gc3dpdGNoZXMgKi8gewoJCQkucGh5c19zdGFydCA9
IDB4ODAwMDAwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHg4MDAwMDAwMCwKCQkJLnNpemUgPSAweDAw
MDAxMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dS
SVRFIHwKCQkJCUpBSUxIT1VTRV9NRU1fSU8sCgkJfSwKCQkvKiBQTCBncGlvIGxlZHMgKi8gewoJ
CQkucGh5c19zdGFydCA9IDB4ODAwMDEwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHg4MDAwMTAwMCwK
CQkJLnNpemUgPSAweDAwMDAxMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBK
QUlMSE9VU0VfTUVNX1dSSVRFIHwKCQkJCUpBSUxIT1VTRV9NRU1fSU8sCgkJfSwKCQkvKiBJVlNI
TUVNIHNoYXJlZCBtZW1vcnkgcmVnaW9uIGZvciAwMDowMC4wICovIHsKCQkJLnBoeXNfc3RhcnQg
PSAweDQxNDAwMDAwLAoJCQkudmlydF9zdGFydCA9IDB4NDE0MDAwMDAsCgkJCS5zaXplID0gMHgx
MDAwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJ
VEUsCgkJfSwKCQkvKiBJVlNITUVNIHNoYXJlZCBtZW1vcnkgcmVnaW9uIGZvciAwMDowMS4wICov
IHsKCQkJLnBoeXNfc3RhcnQgPSAweDQxNTAwMDAwLAoJCQkudmlydF9zdGFydCA9IDB4NDE1MDAw
MDAsCgkJCS5zaXplID0gMHgxMDAwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8
IEpBSUxIT1VTRV9NRU1fV1JJVEUsCgkJfSwKCX0sCgoJLmlycWNoaXBzID0gewoJCS8qIEdJQyAq
LyB7CgkJCS5hZGRyZXNzID0gMHhmOTAxMDAwMCwKCQkJLnBpbl9iYXNlID0gMzIsCgkJCS5waW5f
Yml0bWFwID0gewoJCQkJMHhmZmZmZmZmZiwgMHhmZmZmZmZmZiwgMHhmZmZmZmZmZiwgMHhmZmZm
ZmZmZiwKCQkJfSwKCQl9LAoJfSwKfTsK
--00000000000024eb87058d4c83c4
Content-Type: text/x-csrc; charset="US-ASCII"; name="gic-demo-pl.c"
Content-Disposition: attachment; filename="gic-demo-pl.c"
Content-Transfer-Encoding: base64
Content-ID: <f_jxwrtzsv2>
X-Attachment-Id: f_jxwrtzsv2

LyoKICogSmFpbGhvdXNlLCBhIExpbnV4LWJhc2VkIHBhcnRpdGlvbmluZyBoeXBlcnZpc29yCiAq
CiAqIENvcHlyaWdodCAoYykgQVJNIExpbWl0ZWQsIDIwMTQKICogQ29weXJpZ2h0IChjKSBTaWVt
ZW5zIEFHLCAyMDE0LTIwMTcKICoKICogQXV0aG9yczoKICogIEplYW4tUGhpbGlwcGUgQnJ1Y2tl
ciA8amVhbi1waGlsaXBwZS5icnVja2VyQGFybS5jb20+CiAqICBKYW4gS2lzemthIDxqYW4ua2lz
emthQHNpZW1lbnMuY29tPgogKgogKiBUaGlzIHdvcmsgaXMgbGljZW5zZWQgdW5kZXIgdGhlIHRl
cm1zIG9mIHRoZSBHTlUgR1BMLCB2ZXJzaW9uIDIuICBTZWUKICogdGhlIENPUFlJTkcgZmlsZSBp
biB0aGUgdG9wLWxldmVsIGRpcmVjdG9yeS4KICovCgojaW5jbHVkZSA8aW5tYXRlLmg+CiNpbmNs
dWRlIDxnaWMuaD4KCiNkZWZpbmUgR1BJT19JUlFfTlVNCQkxMzYKCiNkZWZpbmUgR1BJT19MRURT
X0JBU0VfQUREUkVTUyAgCTB4ODAwMDEwMDAgCiNkZWZpbmUgR1BJT19TV0lUQ0hfQkFTRV9BRERS
RVNTICAJMHg4MDAwMDAwMCAKCgpzdGF0aWMgdm9pZCBoYW5kbGVfSVJRKHVuc2lnbmVkIGludCBp
cnFuKQp7CgoJaWYgKGlycW4gIT0gR1BJT19JUlFfTlVNKQoJCXJldHVybjsKCglwcmludGsoIlN3
aXRjaCBjaGFuZ2VkXG4iKTsKCn0KCnZvaWQgaW5tYXRlX21haW4odm9pZCkKewoJdW5zaWduZWQg
aW50ICpwX2dwaW9fbGVkcyA9ICh1bnNpZ25lZCBpbnQgKilHUElPX0xFRFNfQkFTRV9BRERSRVNT
OwoJdW5zaWduZWQgaW50ICpwX2dwaW9fc3dpdGNoID0gKHVuc2lnbmVkIGludCAqKUdQSU9fU1dJ
VENIX0JBU0VfQUREUkVTUzsKCXByaW50aygiSW5pdGlhbGl6aW5nIHRoZSBHSUMgZm9yIEdQSU8g
SVJRLi4uXG4iKTsKCgltbWlvX3dyaXRlMzIocF9ncGlvX2xlZHMgLCAweEE1KTsgLy9Tb21lIGxl
ZHMgb24KCgltbWlvX3dyaXRlMzIoKHBfZ3Bpb19zd2l0Y2ggKyAweDQpLCAweEZGKTsgLy9BbGwg
aW5wdXRzIGluIGdwaW8KCW1taW9fd3JpdGUzMigocF9ncGlvX3N3aXRjaCArIDB4MTI4KSwgMHgx
KTsgLy9FbmFibGUgY2hhbm5lbCAxIGlycQoJbW1pb193cml0ZTMyKChwX2dwaW9fc3dpdGNoICsg
MHgxMUMpLCAweDgwMDAwMDAwKTsgLy9FbmFibGUgZ2xvYmFsIGlycQoKCWdpY19zZXR1cChoYW5k
bGVfSVJRKTsKCWdpY19lbmFibGVfaXJxKEdQSU9fSVJRX05VTSk7CgoJaGFsdCgpOwp9Cg==
--00000000000024eb87058d4c83c4--
