Return-Path: <jailhouse-dev+bncBDM7RQV2QAERBR6ISCJAMGQEBIUATQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x839.google.com (mail-qt1-x839.google.com [IPv6:2607:f8b0:4864:20::839])
	by mail.lfdr.de (Postfix) with ESMTPS id A90AD4EBDB7
	for <lists+jailhouse-dev@lfdr.de>; Wed, 30 Mar 2022 11:35:04 +0200 (CEST)
Received: by mail-qt1-x839.google.com with SMTP id e5-20020ac85985000000b002e217abd72fsf16940748qte.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 30 Mar 2022 02:35:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1648632903; cv=pass;
        d=google.com; s=arc-20160816;
        b=aX2zRJdZ2t4nFvRMwz/Yo5fyk71Nq/PaEkqe7Q0v42Ca7CVmuadhPgSU834MbDkePA
         RY9V0rqKswCliH/x8iGLiq4Nfcs2M5lOjhtLAYoc7gAlNPSUsnC58I8sa5xf4JeKTm2t
         xB2ZZ/Tu2wmUVeXWbNp9IJcK+0gdRxowBbqVS+yiaoVd1eKnCOAsm2lcwed853QNyy4/
         Ubbxd1HqDw8/BubvanGYQCfr3nWkc+FcWT2UZ23EOFtKdjNXdaQC/VbO4Z1zyThoXOQm
         YlqiTtT6dJJsS++krUVBcEC32B990Uu631MNt6Q4QCrbJcLNCylEyojYJBR9BJVeYtqp
         99Rw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=/dyEfmxqRItU+KZ5iqzUHjoBEmo52grY33yFTOjfoCs=;
        b=n9ox23PvGmUX1WKiQJZ88sAg+N5nDnR8GzU8wt64OE0wDpjEIrXnMUu/IPs9/Og87p
         pQhcpcByGgZnmlH4qZufBtExqk53EV/kreKI5+lfNKCmxIJpWriXAC5R0oHsMfEif2Dl
         bjUxzEJWvj2BKdWzq6Fa+LSOSdb56z3inG3mXysgb1xQsN0EB0eDN+EiOOrEUYXoxjMj
         wFJA5vQSesMjbmU7+DvDMGTvZNWv+0SsWbo0NtXtQ9M6M84cOzjtqB6VM9Frd55K73Ao
         yWfm9Wvm2Cmn04+IDa1UmRJxgM02HcgJ5Ya+nIOjN0p5j6pFdBg9zYNgBH0Hy0GUU2WC
         p0LQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=qwziZsuB;
       spf=pass (google.com: domain of moubarakgoumpougni@gmail.com designates 2607:f8b0:4864:20::b30 as permitted sender) smtp.mailfrom=moubarakgoumpougni@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/dyEfmxqRItU+KZ5iqzUHjoBEmo52grY33yFTOjfoCs=;
        b=HPa859tf5GT5MT3gV2Zg21F0bQI9OQaaHcl1ZB163W4UvA5qZsjaWXlmEXCEwCK/w6
         8yixiKHvkDrnxzY441k5ECMSTk+OspJ5nLIVEjmHG1uM1gHteCk7V6BUUpKsVkxdrkOG
         oepI08iel8x7meSCdzNcSiT1ES9o+Jf6OWVFCfXZckxA11BqEnrJs89tsd8FFrorEsDU
         sxYaN7t7oTEL+MvlUfM9zQWGEQOUFsNg55Hi1WH/juEIMRNcsmfrUzgFDQWhUu3fd4kw
         UdJPuyNT7J46AQYMxDwyCwJiiIpUOyRizV/GrDRhvg5HHm+P+LteiUanEte4vIOB1/zQ
         iG7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/dyEfmxqRItU+KZ5iqzUHjoBEmo52grY33yFTOjfoCs=;
        b=exXKgzU0w+toQhtRtMDTDFp2JVJvtzdCGlB3qEv9liiHm9TVDoex/Rpyh8zooQXQ1Y
         C3Dr9mgH/eQj0ttHn9DtXRNI/WshWUEmj29pYPa3DGR06k1/1RpndOjpZAiDzqMhEqdV
         2paqh5ZB1IoOPYdQxEpxDXakSiY6K6f47YIBu0j4Rko5FFr0a7xWm3HOCusUmgOYisTj
         djXxhYIzCvPLTZ4NrEHGjjlgQFzxheiZA6uTVj6GL0PHudp1K+BkIVrcO4+m7jxynl3V
         Js5VGI2DUpEU7R05gpfWoIWOwrY1g4DujtOXW0TLrZZElh6JqP8q14TdeciOg59S0Qjo
         tkUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=/dyEfmxqRItU+KZ5iqzUHjoBEmo52grY33yFTOjfoCs=;
        b=FSL1+P++OHrmrgzijMz38fGl+JMpWIsA+RFQW+8Pfa9bjp2pU8j2gfiUMuvro2tva2
         G4YM0OTCeixU1Po8AMrEfnSlN5rJaobhq0pa2e19aJV6B3tY8IQNEHaVGE5biSiCVECh
         eyeijFNynfV5wexV9qIHlpe7wgmqius7rklj8C+CPQ21E3PruRyX7vv7T/a1jHo3WhvN
         SMGdHHrSd685pTjjiesP6VeZ8k3f60M3m0nRCYn/CuVInr9bwJLzGP6GrBd6LcsIWJRx
         kPbg2StRtOTeqDB99pQjCUwXD84GHhA3Y3DDtPa+QUSR1kqwi7zKqPjK83XhtGykuqPm
         UOqA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531wkS5tc2c+pya0zwzNVtZBcHlipmIihf8vuRxmSM5X517rcFaC
	VwUu7nCJec6Wbz7mFfmKd0M=
X-Google-Smtp-Source: ABdhPJyqqvXjjamDnKWN1atWn3tvwUkkSgPsSNufjLOj6EBUHoDMqq0ky6aVGvNJm+LfMzZ/Cum7NQ==
X-Received: by 2002:ac8:4e48:0:b0:2e1:ce40:3d81 with SMTP id e8-20020ac84e48000000b002e1ce403d81mr32153736qtw.78.1648632903641;
        Wed, 30 Mar 2022 02:35:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:622a:14c8:b0:2e1:9fcd:b2ae with SMTP id
 u8-20020a05622a14c800b002e19fcdb2aels1132360qtx.5.gmail; Wed, 30 Mar 2022
 02:35:03 -0700 (PDT)
X-Received: by 2002:ac8:5ccc:0:b0:2e2:3538:7b2b with SMTP id s12-20020ac85ccc000000b002e235387b2bmr31530242qta.47.1648632902997;
        Wed, 30 Mar 2022 02:35:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648632902; cv=none;
        d=google.com; s=arc-20160816;
        b=L8rLom+M8hkyP8DNzB8A0f0YYM3Z6hXenpN1QpHWqDyW7KbA6G4qLcCiQk7MZ0NU0I
         CijGND0uNey9ihoNB8czae5kueJC2Qn561VybtwObH8KBe5uOyz6BLClEAxWUH9ygv7I
         yEpNcTbEYWPVgw0bsv+qzV/QTVUuL/jAAuK2kGP1XMsR6EFPHLKIyjK/YxomcqMsONx3
         6YQzBosvXx1v8cZUR0JS2dt3ammAfSHKVDQG7G+2eTst7op9i3A57HXVWzlaPKRSCspl
         VYwmvnaytgSPZ6IK6fK91+wjTIojQ2h20o2TPtZt7GRPhgtBEsk5ApX8HbaTmzTwlTKa
         uXyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=aMxcJRB1BL/j8DD7nBatcgLu6zez7J1fAeiek0BRXEo=;
        b=k1KSX83AIQODfee6jPOKma1Za1UjbHOMd7wS+b1haDP02TuETuZsSyOf2KKnT3jSTy
         tCw32U7FNpKcdIuxRSlmYHUyqvNBPm6hh0/Wjs1YEfK6xc3vmlhXIp2k9jiVBliXZ+IF
         Sx54MonDqFCIM/Rz/TcHMR86UgSm4JxnOo7cAftFmmmvcx3ptlqBwNESKSdCUlAmFZ0s
         3qge7gTAiAF5HO2PJl9/m2Hm/gWfX6F/bUV6hFhdKupvG2y2OkQ5/WdQuYV7K9NifkpZ
         Gpmdt5HB6ltekQXYZN8/5Fp4uaYgeI9LPOhkKeY91sIy/LtZLVhxVtXxv2whAO2YKin9
         J2QA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=qwziZsuB;
       spf=pass (google.com: domain of moubarakgoumpougni@gmail.com designates 2607:f8b0:4864:20::b30 as permitted sender) smtp.mailfrom=moubarakgoumpougni@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com. [2607:f8b0:4864:20::b30])
        by gmr-mx.google.com with ESMTPS id p20-20020ac84094000000b002e1e5e87168si1264395qtl.1.2022.03.30.02.35.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Mar 2022 02:35:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of moubarakgoumpougni@gmail.com designates 2607:f8b0:4864:20::b30 as permitted sender) client-ip=2607:f8b0:4864:20::b30;
Received: by mail-yb1-xb30.google.com with SMTP id t11so36006758ybi.6
        for <jailhouse-dev@googlegroups.com>; Wed, 30 Mar 2022 02:35:02 -0700 (PDT)
X-Received: by 2002:a25:c5cc:0:b0:633:78f9:1b8c with SMTP id
 v195-20020a25c5cc000000b0063378f91b8cmr32638576ybe.423.1648632902848; Wed, 30
 Mar 2022 02:35:02 -0700 (PDT)
MIME-Version: 1.0
From: Sarah Riterhouse <sarahriterhouse89@gmail.com>
Date: Wed, 30 Mar 2022 09:34:41 +0000
Message-ID: <CA+u5MaFoa2JrXSbxL9YXPPkTGuBzZ4pzZbxt8NgqbSZRvcP5gQ@mail.gmail.com>
Subject: HIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000008a134a05db6c429d"
X-Original-Sender: sarahriterhouse89@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=qwziZsuB;       spf=pass
 (google.com: domain of moubarakgoumpougni@gmail.com designates
 2607:f8b0:4864:20::b30 as permitted sender) smtp.mailfrom=moubarakgoumpougni@gmail.com;
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

--0000000000008a134a05db6c429d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=E6=82=A8=E5=A5=BD=EF=BC=8C=E8=AF=B7=E7=A1=AE=E8=AE=A4=E6=AD=A4=E9=82=AE=E4=
=BB=B6=E6=98=AF=E5=90=A6=E5=A4=84=E4=BA=8E=E6=B4=BB=E5=8A=A8=E7=8A=B6=E6=80=
=81=E3=80=82

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CA%2Bu5MaFoa2JrXSbxL9YXPPkTGuBzZ4pzZbxt8NgqbSZRvcP5gQ%40mail.=
gmail.com.

--0000000000008a134a05db6c429d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">=E6=82=A8=E5=A5=
=BD=EF=BC=8C=E8=AF=B7=E7=A1=AE=E8=AE=A4=E6=AD=A4=E9=82=AE=E4=BB=B6=E6=98=AF=
=E5=90=A6=E5=A4=84=E4=BA=8E=E6=B4=BB=E5=8A=A8=E7=8A=B6=E6=80=81=E3=80=82<br=
></div></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CA%2Bu5MaFoa2JrXSbxL9YXPPkTGuBzZ4pzZbxt8NgqbSZRvcP=
5gQ%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CA%2Bu5MaFoa2JrXSbxL9YXPPkTGuBzZ4pzZbxt8N=
gqbSZRvcP5gQ%40mail.gmail.com</a>.<br />

--0000000000008a134a05db6c429d--
