Return-Path: <jailhouse-dev+bncBD2KJCOQRYJRB5VOU2DAMGQEII743SY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73a.google.com (mail-qk1-x73a.google.com [IPv6:2607:f8b0:4864:20::73a])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCB73A91C3
	for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Jun 2021 08:17:27 +0200 (CEST)
Received: by mail-qk1-x73a.google.com with SMTP id c15-20020ae9e20f0000b02903aafa8c83e7sf938146qkc.21
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 23:17:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623824246; cv=pass;
        d=google.com; s=arc-20160816;
        b=t8yoWjtyQ1dl/+5Ys5KAWra85r5tLWvmC7+qTenbYO0zYImbXSwfUfAriQw//p8MLN
         /80QxPuvOmb/BWU+lnMKfJDPNlMU8wj19Y3TeRN4VWjMdi8pHCEuEPunYqbTejGypss3
         kGFUv8gdnvJ1z4myuP+eJa/wX3Kal2KZu0eKI7n/5CaNTk0sBwEOa+RqIXa/tZA9YZ6R
         KocFivk2jpVIj6rHYXCemXMk+tDMCOVOx501CDSOrOj7wY6v7VVG7qe83xkVFa1McIWW
         vwISkpNQX14xbOsDqMnoOmwCqBIVpqh5Gn5T9XFrc18lwm+6DGb9VSt9tpkzMGNOcYTK
         N81g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature;
        bh=79JX6EjRPV1L7dUxTNRruZTWZYzWtX/Ll1cntTaB+mw=;
        b=sGU1C35VEHpv4q/yWoQql/UFnGH7XNq3UchBfPszEDzpxAJVSJAuYZNVTMEHyK+0wg
         ON/r8onqAVk5tTvO4W07vp3rKqh+DKzlO6DKWUGHfG9idRsol+v23h9tWFgq0lb9L0fW
         Az+PpsVgoO2wIDftksJ4bX1lQzjMLJzB36MX13sbj7rDHhj3HE3YIvapoC28nKLGVq/B
         4w4+pVRa88capz3PR+dsAnuoJZMGYNaufikeOIwxQ0SlqQAA+sywK7ku3xpUrslsuB7y
         UIZpwGBmOBM/seXiFo5UPQe8jTzLczMhFLmAQyBjFDAuqw8me3OUinRPMIYP6Q8wWx38
         jnBg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@cimware-in.20150623.gappssmtp.com header.s=20150623 header.b="fvsvZU/d";
       spf=pass (google.com: domain of kannan@cimware.in designates 2607:f8b0:4864:20::d2d as permitted sender) smtp.mailfrom=kannan@cimware.in
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=79JX6EjRPV1L7dUxTNRruZTWZYzWtX/Ll1cntTaB+mw=;
        b=BHI4Ccv0FMQsX+aknQtjirqGLoQEEq4ka7ynJaNN2fWePxJAZTzXX5fUkNIrGkd0+7
         T9AKhhL34bc50+b81j2ooI5UXA73q8g+3N9CoKwMFyFBr1nsKT/QcH2nw5h0kFOUvyGA
         aZ+okhmjMyUEfJp0Ixz47U494u2BBI2/ZtsKzwzu3HqQy7n4iiAG2gIUhCZkI0pekP4g
         6GMdute4KhagGOum8sdThaBK63iOaX2XwVCz1ii+Mzdstzwx94FsllZeHivtnd2yPmBN
         NLgzS9Nw/i/MmXRUWlSB8VUxxix+Xx18A312bSdqGfNmRP5Xbd2aXnRoLleGrnTAwZ1Q
         ak2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=79JX6EjRPV1L7dUxTNRruZTWZYzWtX/Ll1cntTaB+mw=;
        b=Nyx6ww0RoZ8427vUhENLRk3pHUXtgwOyNeUcFCUq5pbYjSw+Yc8gjQoqryoSpxKewl
         HzpPJkAfRTeZESKSo2OOPzkhS5F5TiPLUgyKfykGoEQbNeDcH3LS4ft8lOgLpC2ooGZr
         yYeZeI1ELuczx8feprP3FcGqynxr7+mImLnho+sfnjYmcoFLjpLcg7C4YBFulhppAFqH
         cpMfwytY9G4NYcBr9Faj80PKciuVsd5iQAm6NiaCF2qWEMXEdkpAujS4PmIo7Sr8fid4
         fY2uml8rTFm37d44w6xJ4D7mtBlzY2BsO0gL6UFuw3CKCS3uMQ+dHC9e4t6+EW3A1T1m
         BbRA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532jH/933WrOU/f340oMs4Ywv2R0RaAZZ2gOycN9zvyTR+J76Mhv
	/LLXHoTB5uRFlDzv2fTVL7o=
X-Google-Smtp-Source: ABdhPJzP5nGk00R/PixD5oef40E/OBI1nOmnVEeoTQGESo8nsQ6pYA1GnLzFSL0IpFFRWQl6bSOxsw==
X-Received: by 2002:a37:9ed4:: with SMTP id h203mr3560436qke.347.1623824246418;
        Tue, 15 Jun 2021 23:17:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:4553:: with SMTP id s80ls912431qka.2.gmail; Tue, 15 Jun
 2021 23:17:25 -0700 (PDT)
X-Received: by 2002:a37:a3ce:: with SMTP id m197mr3594650qke.77.1623824245865;
        Tue, 15 Jun 2021 23:17:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623824245; cv=none;
        d=google.com; s=arc-20160816;
        b=F3nQBWwsb6iCb5+OYGwgR6thaQyuciUy5YIDzW+Mri/5W7w0Q/OQVPBJCrXFixPp6f
         WCAoYD8JEICDVgmjsXQC92zNknqi1xdFPFK2mXx1mgeCcz9RD0yc37DedDgAxdN6Qvuq
         +yTatq79JwuIbhgonaSYZHe1qxYeqWq+Li9yWfox2SKfIQGEBGqj9XZMvuPX3w/LJfbc
         a/LTio18Jo3s6Kq5VDqM19CNS6t6aL4L4hB+cAC8jmF2EJmQH/3hAxZjfabwNcb0A9gd
         ByvqYcv4DOsJaJ5VRJzztWu5yQF8JI1dS3gx71dnyuEam1g6d5jtFFDf+inOOKbMHJoZ
         js+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=iOClCAYAgYUMXMr2JTuNCUCG/pLApEl725qjc81NNbU=;
        b=jqNXnhxVLl/T/aswQVUTvopd/1ehfrthIhoVXtwNIJdlesejT9W5NaRbYNgqL17siI
         rvnr8CafrALUnENexltzHRyc5CLJDuXa/nbY5ruGj3yMp0BNH2ZTgxwWGfngOFlORQep
         1xBXKLsVNe9F39Llo/M2nQQs3Igjcy+LDan1RE8c4SSCENI6X60jDqklIEAiWJR59sbI
         7jtcAZZctVG60tPDEd9N+7EDcA8UzkAZ/3J3btc3lJs3fgeOHF1/cYWY3sjutnw1TK1N
         buGQGT1K4HOhrAsQWUPBW33ayvSG/OUMPYMOyF1VancZx9XoI4yTD75mdf/q3gu4CEWL
         L8jg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@cimware-in.20150623.gappssmtp.com header.s=20150623 header.b="fvsvZU/d";
       spf=pass (google.com: domain of kannan@cimware.in designates 2607:f8b0:4864:20::d2d as permitted sender) smtp.mailfrom=kannan@cimware.in
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com. [2607:f8b0:4864:20::d2d])
        by gmr-mx.google.com with ESMTPS id g9si74276qtj.3.2021.06.15.23.17.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 23:17:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of kannan@cimware.in designates 2607:f8b0:4864:20::d2d as permitted sender) client-ip=2607:f8b0:4864:20::d2d;
Received: by mail-io1-xd2d.google.com with SMTP id s19so1845876ioc.3
        for <jailhouse-dev@googlegroups.com>; Tue, 15 Jun 2021 23:17:24 -0700 (PDT)
X-Received: by 2002:a5e:8349:: with SMTP id y9mr2270808iom.105.1623824244284;
 Tue, 15 Jun 2021 23:17:24 -0700 (PDT)
MIME-Version: 1.0
From: Kannan Sivaraman <kannan@cimware.in>
Date: Wed, 16 Jun 2021 11:47:13 +0530
Message-ID: <CALeLWRh2ZrWUfQk1GcizTXMmN2BOVKtnfjBpFdJ+62eym8zgPg@mail.gmail.com>
Subject: arm64 - help needed for creating root cell configuration..
To: jailhouse-dev@googlegroups.com
Content-Type: multipart/mixed; boundary="0000000000004251cb05c4dc0b82"
X-Original-Sender: kannan@cimware.in
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@cimware-in.20150623.gappssmtp.com header.s=20150623
 header.b="fvsvZU/d";       spf=pass (google.com: domain of kannan@cimware.in
 designates 2607:f8b0:4864:20::d2d as permitted sender) smtp.mailfrom=kannan@cimware.in
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

--0000000000004251cb05c4dc0b82
Content-Type: multipart/alternative; boundary="0000000000004251c805c4dc0b80"

--0000000000004251c805c4dc0b80
Content-Type: text/plain; charset="UTF-8"

Dear Jailhouse community,
    I am trying to create root cell configuration for a system with 80 ARM
cores. Can any expert help in creating the root cell configuration
file. Attached is the file containing the output of /proc/iomem.

Thanks,
Kannan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CALeLWRh2ZrWUfQk1GcizTXMmN2BOVKtnfjBpFdJ%2B62eym8zgPg%40mail.gmail.com.

--0000000000004251c805c4dc0b80
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dear Jailhouse community,<div>=C2=A0 =C2=A0 I am trying to=
 create root cell configuration for a system with 80 ARM cores. Can any exp=
ert help in creating the root cell configuration file.=C2=A0Attached is the=
 file containing the output of /proc/iomem.</div><div><br></div><div>Thanks=
,</div><div>Kannan</div><div><br></div><div><br></div><div><br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CALeLWRh2ZrWUfQk1GcizTXMmN2BOVKtnfjBpFdJ%2B62eym8z=
gPg%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CALeLWRh2ZrWUfQk1GcizTXMmN2BOVKtnfjBpFdJ%=
2B62eym8zgPg%40mail.gmail.com</a>.<br />

--0000000000004251c805c4dc0b80--
--0000000000004251cb05c4dc0b82
Content-Type: text/plain; charset="US-ASCII"; name="layout.txt"
Content-Disposition: attachment; filename="layout.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_kpz308no0>
X-Attachment-Id: f_kpz308no0

MDA4MDAwMDAtMGZmZmZmZmYgOiBQQ0kgQnVzIDAwMDI6MDAKICAwMDgwMDAwMC0wMDlmZmZmZiA6
IFBDSSBCdXMgMDAwMjowMQogIDAwYTAwMDAwLTAwYmZmZmZmIDogUENJIEJ1cyAwMDAyOjAyCiAg
MDBjMDAwMDAtMDBkZmZmZmYgOiBQQ0kgQnVzIDAwMDI6MDMKICAwMGUwMDAwMC0wMGZmZmZmZiA6
IFBDSSBCdXMgMDAwMjowNAoxMDAwMDAwMC0xZmZmZmZmZiA6IFBDSSBCdXMgMDAwMzowMAogIDEw
MDAwMDAwLTEwMWZmZmZmIDogUENJIEJ1cyAwMDAzOjAxCiAgMTAyMDAwMDAtMTAzZmZmZmYgOiBQ
Q0kgQnVzIDAwMDM6MDIKICAxMDQwMDAwMC0xMDVmZmZmZiA6IFBDSSBCdXMgMDAwMzowMwogICAg
MTA0MDAwMDAtMTA0MWZmZmYgOiAwMDAzOjAzOjAwLjAKICAgICAgMTA0MDAwMDAtMTA0MWZmZmYg
OiBpZ2IKICAgIDEwNDIwMDAwLTEwNDNmZmZmIDogMDAwMzowMzowMC4xCiAgICAgIDEwNDIwMDAw
LTEwNDNmZmZmIDogaWdiCiAgICAxMDQ0MDAwMC0xMDQ0M2ZmZiA6IDAwMDM6MDM6MDAuMAogICAg
ICAxMDQ0MDAwMC0xMDQ0M2ZmZiA6IGlnYgogICAgMTA0NDQwMDAtMTA0NDdmZmYgOiAwMDAzOjAz
OjAwLjEKICAgICAgMTA0NDQwMDAtMTA0NDdmZmYgOiBpZ2IKMjAwMDAwMDAtMmZmZmZmZmYgOiBQ
Q0kgQnVzIDAwMDQ6MDAKICAyMDAwMDAwMC0yMmZmZmZmZiA6IFBDSSBCdXMgMDAwNDowMQogICAg
MjAwMDAwMDAtMjJmZmZmZmYgOiBQQ0kgQnVzIDAwMDQ6MDIKICAgICAgMjAwMDAwMDAtMjFmZmZm
ZmYgOiAwMDA0OjAyOjAwLjAKICAgICAgMjIwMDAwMDAtMjIwMWZmZmYgOiAwMDA0OjAyOjAwLjAK
ICAyMzAwMDAwMC0yMzFmZmZmZiA6IFBDSSBCdXMgMDAwNDowMwogICAgMjMwMDAwMDAtMjMwMDFm
ZmYgOiAwMDA0OjAzOjAwLjAKICAgICAgMjMwMDAwMDAtMjMwMDFmZmYgOiB4aGNpLWhjZAogIDIz
MjAwMDAwLTIzM2ZmZmZmIDogUENJIEJ1cyAwMDA0OjA0CjMwMDAwMDAwLTNmZmZmZmZmIDogUENJ
IEJ1cyAwMDA1OjAwCiAgMzAwMDAwMDAtMzAxZmZmZmYgOiBQQ0kgQnVzIDAwMDU6MDEKICAgIDMw
MDAwMDAwLTMwMDBmZmZmIDogMDAwNTowMTowMC4wCiAgICAzMDAxMDAwMC0zMDAxM2ZmZiA6IDAw
MDU6MDE6MDAuMAogICAgICAzMDAxMDAwMC0zMDAxM2ZmZiA6IG52bWUKICAzMDIwMDAwMC0zMDNm
ZmZmZiA6IFBDSSBCdXMgMDAwNTowMgogIDMwNDAwMDAwLTMwNWZmZmZmIDogUENJIEJ1cyAwMDA1
OjAzCiAgMzA2MDAwMDAtMzA3ZmZmZmYgOiBQQ0kgQnVzIDAwMDU6MDQKNDAwMDAwMDAtNGZmZmZm
ZmYgOiBQQ0kgQnVzIDAwMGM6MDAKICA0MDAwMDAwMC00MDFmZmZmZiA6IFBDSSBCdXMgMDAwYzow
MQogIDQwMjAwMDAwLTQwM2ZmZmZmIDogUENJIEJ1cyAwMDBjOjAyCiAgNDA0MDAwMDAtNDA1ZmZm
ZmYgOiBQQ0kgQnVzIDAwMGM6MDMKICA0MDYwMDAwMC00MDdmZmZmZiA6IFBDSSBCdXMgMDAwYzow
NAo1MDAwMDAwMC01ZmZmZmZmZiA6IFBDSSBCdXMgMDAwZDowMAogIDUwMDAwMDAwLTUwMWZmZmZm
IDogUENJIEJ1cyAwMDBkOjAxCiAgNTAyMDAwMDAtNTAzZmZmZmYgOiBQQ0kgQnVzIDAwMGQ6MDIK
ICA1MDQwMDAwMC01MDVmZmZmZiA6IFBDSSBCdXMgMDAwZDowMwogIDUwNjAwMDAwLTUwN2ZmZmZm
IDogUENJIEJ1cyAwMDBkOjA0CjYwMDAwMDAwLTZmZmZmZmZmIDogUENJIEJ1cyAwMDAxOjAwCiAg
NjAwMDAwMDAtNjAxZmZmZmYgOiBQQ0kgQnVzIDAwMDE6MDEKICA2MDIwMDAwMC02MDNmZmZmZiA6
IFBDSSBCdXMgMDAwMTowMgogIDYwNDAwMDAwLTYwNWZmZmZmIDogUENJIEJ1cyAwMDAxOjAzCiAg
NjA2MDAwMDAtNjA3ZmZmZmYgOiBQQ0kgQnVzIDAwMDE6MDQKNzAwMDAwMDAtN2ZmZmZmZmYgOiBQ
Q0kgQnVzIDAwMDA6MDAKICA3MDAwMDAwMC03MDFmZmZmZiA6IFBDSSBCdXMgMDAwMDowMQogIDcw
MjAwMDAwLTcwM2ZmZmZmIDogUENJIEJ1cyAwMDAwOjAyCiAgNzA0MDAwMDAtNzA1ZmZmZmYgOiBQ
Q0kgQnVzIDAwMDA6MDMKICA3MDYwMDAwMC03MDdmZmZmZiA6IFBDSSBCdXMgMDAwMDowNAo4ODMw
MDAwMC04ODNmZmZmZiA6IHJlc2VydmVkCjg4OTAwMDAwLTg4OTFmZmZmIDogQU1QQzAwMDU6MDAK
OTAwMDAwMDAtOTFmZmZmZmYgOiBTeXN0ZW0gUkFNCjkyMDAwMDAwLTkzZmZmZmZmIDogcmVzZXJ2
ZWQKOTQwMDAwMDAtZWZhOGZmZmYgOiBTeXN0ZW0gUkFNCiAgOTQ0YzAwMDAtOTU4ZWZmZmYgOiBL
ZXJuZWwgY29kZQogIDk1OGYwMDAwLTk1ZTRmZmZmIDogcmVzZXJ2ZWQKICA5NWU1MDAwMC05NzFh
ZmZmZiA6IEtlcm5lbCBkYXRhCiAgYzlhMDAwMDAtZTU5ZmZmZmYgOiBDcmFzaCBrZXJuZWwKICBl
NWE4MDAwMC1lOGNiZmZmZiA6IHJlc2VydmVkCiAgZWIxODAwMDAtZWIxOGZmZmYgOiByZXNlcnZl
ZAogIGViMWEwMDAwLWViMWFmZmZmIDogcmVzZXJ2ZWQKICBlZWUzMDAwMC1lZWUzZmZmZiA6IHJl
c2VydmVkCmVmYTkwMDAwLWVmZTdmZmZmIDogcmVzZXJ2ZWQKZWZlODAwMDAtZjAwOWZmZmYgOiBT
eXN0ZW0gUkFNCiAgZWZlZDAwMDAtZjAwM2ZmZmYgOiByZXNlcnZlZApmMDBhMDAwMC1mMDBhZmZm
ZiA6IHJlc2VydmVkCmYwMGIwMDAwLWYxODRmZmZmIDogU3lzdGVtIFJBTQpmMTg1MDAwMC1mNzZk
ZmZmZiA6IHJlc2VydmVkCmY3NmUwMDAwLWY3OGFmZmZmIDogU3lzdGVtIFJBTQpmNzhiMDAwMC1m
N2ZkZmZmZiA6IHJlc2VydmVkCmY3ZmUwMDAwLWZmYzdmZmZmIDogU3lzdGVtIFJBTQogIGZiYzgw
MDAwLWZmYzdmZmZmIDogcmVzZXJ2ZWQKZmZjODAwMDAtZmZjOGZmZmYgOiByZXNlcnZlZApmZmM5
MDAwMC1mZmZmZmZmZiA6IFN5c3RlbSBSQU0KICBmZmZmMDAwMC1mZmZmZmZmZiA6IHJlc2VydmVk
CjgwMDAwMDAwMDAwLTgwMDdmZmZmZmZmIDogU3lzdGVtIFJBTQo4MDEwMDAwMDAwMC04MDNmZmZm
ZmZmZiA6IFN5c3RlbSBSQU0KICA4MDE5M2UwMDAwMC04MDE5M2UwZmZmZiA6IHJlc2VydmVkCiAg
ODAxZTAwMDAwMDAtODAxZTBmZmZmZmYgOiByZXNlcnZlZAogIDgwM2MwOTIwMDAwLTgwM2MwOTJm
ZmZmIDogcmVzZXJ2ZWQKICA4MDNjMDkzMDAwMC04MDNjMDkzMGZmZiA6IHJlc2VydmVkCiAgODAz
YzA5NDAwMDAtODAzYzA5NGZmZmYgOiByZXNlcnZlZAogIDgwM2MwOTUwMDAwLTgwM2MwOTVmZmZm
IDogcmVzZXJ2ZWQKICA4MDNjMDk2MDAwMC04MDNjMDk2ZmZmZiA6IHJlc2VydmVkCiAgODAzYzA5
NzAwMDAtODAzYzA5N2ZmZmYgOiByZXNlcnZlZAogIDgwM2MwOTgwMDAwLTgwM2MwOThmZmZmIDog
cmVzZXJ2ZWQKICA4MDNjMDk5MDAwMC04MDNjMDk5ZmZmZiA6IHJlc2VydmVkCiAgODAzYzA5YTAw
MDAtODAzYzA5YWZmZmYgOiByZXNlcnZlZAogIDgwM2MwOWIwMDAwLTgwM2MwOWJmZmZmIDogcmVz
ZXJ2ZWQKICA4MDNjMDljMDAwMC04MDNjMDljZmZmZiA6IHJlc2VydmVkCiAgODAzYzA5ZDAwMDAt
ODAzYzA5ZGZmZmYgOiByZXNlcnZlZAogIDgwM2MwOWUwMDAwLTgwM2MwOWVmZmZmIDogcmVzZXJ2
ZWQKICA4MDNjMDlmMDAwMC04MDNjMDlmZmZmZiA6IHJlc2VydmVkCiAgODAzYzBhMDAwMDAtODAz
YzBhMGZmZmYgOiByZXNlcnZlZAogIDgwM2MwYTEwMDAwLTgwM2MwYTFmZmZmIDogcmVzZXJ2ZWQK
ICA4MDNjMGEyMDAwMC04MDNjMGEyZmZmZiA6IHJlc2VydmVkCiAgODAzYzBhMzAwMDAtODAzYzBh
M2ZmZmYgOiByZXNlcnZlZAogIDgwM2MwYTQwMDAwLTgwM2MwYTRmZmZmIDogcmVzZXJ2ZWQKICA4
MDNjMGE1MDAwMC04MDNjMGE1ZmZmZiA6IHJlc2VydmVkCiAgODAzYzBhNjAwMDAtODAzYzBhNmZm
ZmYgOiByZXNlcnZlZAogIDgwM2MwYTcwMDAwLTgwM2MwYTdmZmZmIDogcmVzZXJ2ZWQKICA4MDNj
MGE4MDAwMC04MDNjMGE4ZmZmZiA6IHJlc2VydmVkCiAgODAzYzBhOTAwMDAtODAzYzBhOWZmZmYg
OiByZXNlcnZlZAogIDgwM2MwYWEwMDAwLTgwM2MwYWFmZmZmIDogcmVzZXJ2ZWQKICA4MDNjMGFi
MDAwMC04MDNjMGFiZmZmZiA6IHJlc2VydmVkCiAgODAzYzBhYzAwMDAtODAzYzBhY2ZmZmYgOiBy
ZXNlcnZlZAogIDgwM2MwYWQwMDAwLTgwM2MwYWRmZmZmIDogcmVzZXJ2ZWQKICA4MDNjMGFlMDAw
MC04MDNjMGFlZmZmZiA6IHJlc2VydmVkCiAgODAzYzBhZjAwMDAtODAzYzBhZmZmZmYgOiByZXNl
cnZlZAogIDgwM2MwYjAwMDAwLTgwM2MwYjBmZmZmIDogcmVzZXJ2ZWQKICA4MDNjMGIxMDAwMC04
MDNjMGIxZmZmZiA6IHJlc2VydmVkCiAgODAzYzBiMjAwMDAtODAzYzBiMmZmZmYgOiByZXNlcnZl
ZAogIDgwM2MwYjMwMDAwLTgwM2MwYjNmZmZmIDogcmVzZXJ2ZWQKICA4MDNjMGI0MDAwMC04MDNj
MGI0ZmZmZiA6IHJlc2VydmVkCiAgODAzYzBiNTAwMDAtODAzYzBiNWZmZmYgOiByZXNlcnZlZAog
IDgwM2MwYjYwMDAwLTgwM2MwYjZmZmZmIDogcmVzZXJ2ZWQKICA4MDNjMGI3MDAwMC04MDNjMGI3
ZmZmZiA6IHJlc2VydmVkCiAgODAzYzBiODAwMDAtODAzYzBiOGZmZmYgOiByZXNlcnZlZAogIDgw
M2MwYjkwMDAwLTgwM2MwYjlmZmZmIDogcmVzZXJ2ZWQKICA4MDNjMGJhMDAwMC04MDNjMGJhZmZm
ZiA6IHJlc2VydmVkCiAgODAzYzBiYjAwMDAtODAzYzBiYmZmZmYgOiByZXNlcnZlZAogIDgwM2Mw
YmMwMDAwLTgwM2MwYmNmZmZmIDogcmVzZXJ2ZWQKICA4MDNjMGJkMDAwMC04MDNjMGJkZmZmZiA6
IHJlc2VydmVkCiAgODAzYzBiZTAwMDAtODAzYzBiZWZmZmYgOiByZXNlcnZlZAogIDgwM2MwYmYw
MDAwLTgwM2MwYmZmZmZmIDogcmVzZXJ2ZWQKICA4MDNjMGMwMDAwMC04MDNjMGMwZmZmZiA6IHJl
c2VydmVkCiAgODAzYzBjMTAwMDAtODAzYzBjMWZmZmYgOiByZXNlcnZlZAogIDgwM2MwYzIwMDAw
LTgwM2MwYzJmZmZmIDogcmVzZXJ2ZWQKICA4MDNjMGMzMDAwMC04MDNjMGMzZmZmZiA6IHJlc2Vy
dmVkCiAgODAzYzBjNDAwMDAtODAzYzBjNGZmZmYgOiByZXNlcnZlZAogIDgwM2MwYzUwMDAwLTgw
M2MwYzVmZmZmIDogcmVzZXJ2ZWQKICA4MDNjMGM2MDAwMC04MDNjMGM2ZmZmZiA6IHJlc2VydmVk
CiAgODAzYzBjNzAwMDAtODAzYzBjN2ZmZmYgOiByZXNlcnZlZAogIDgwM2MwYzgwMDAwLTgwM2Mw
YzhmZmZmIDogcmVzZXJ2ZWQKICA4MDNjMGM5MDAwMC04MDNjMGM5ZmZmZiA6IHJlc2VydmVkCiAg
ODAzYzBjYTAwMDAtODAzYzBjYWZmZmYgOiByZXNlcnZlZAogIDgwM2MwY2IwMDAwLTgwM2MwY2Jm
ZmZmIDogcmVzZXJ2ZWQKICA4MDNjMGNjMDAwMC04MDNjMGNjZmZmZiA6IHJlc2VydmVkCiAgODAz
YzBjZDAwMDAtODAzYzBjZGZmZmYgOiByZXNlcnZlZAogIDgwM2MwY2UwMDAwLTgwM2MwY2VmZmZm
IDogcmVzZXJ2ZWQKICA4MDNjMGNmMDAwMC04MDNjMGNmZmZmZiA6IHJlc2VydmVkCiAgODAzYzBk
MDAwMDAtODAzYzBkMGZmZmYgOiByZXNlcnZlZAogIDgwM2MwZDEwMDAwLTgwM2MwZDFmZmZmIDog
cmVzZXJ2ZWQKICA4MDNjMGQyMDAwMC04MDNjMGQyZmZmZiA6IHJlc2VydmVkCiAgODAzYzBkMzAw
MDAtODAzYzBkM2ZmZmYgOiByZXNlcnZlZAogIDgwM2MwZDQwMDAwLTgwM2MwZDRmZmZmIDogcmVz
ZXJ2ZWQKICA4MDNjMGQ1MDAwMC04MDNjMGQ1ZmZmZiA6IHJlc2VydmVkCiAgODAzYzBkNjAwMDAt
ODAzYzBkNmZmZmYgOiByZXNlcnZlZAogIDgwM2MwZDcwMDAwLTgwM2MwZDdmZmZmIDogcmVzZXJ2
ZWQKICA4MDNjMGQ4MDAwMC04MDNjMGQ4ZmZmZiA6IHJlc2VydmVkCiAgODAzYzBkOTAwMDAtODAz
YzBkOWZmZmYgOiByZXNlcnZlZAogIDgwM2MwZGEwMDAwLTgwM2MwZGFmZmZmIDogcmVzZXJ2ZWQK
ICA4MDNjMGRiMDAwMC04MDNjMGRiZmZmZiA6IHJlc2VydmVkCiAgODAzYzBkYzAwMDAtODAzYzBk
Y2ZmZmYgOiByZXNlcnZlZAogIDgwM2MwZGQwMDAwLTgwM2MwZGRmZmZmIDogcmVzZXJ2ZWQKICA4
MDNjMGRlMDAwMC04MDNjMGRlZmZmZiA6IHJlc2VydmVkCiAgODAzYzBkZjAwMDAtODAzYzBkZmZm
ZmYgOiByZXNlcnZlZAogIDgwM2MwZTAwMDAwLTgwM2MwZTBmZmZmIDogcmVzZXJ2ZWQKICA4MDNj
MGUxMDAwMC04MDNjMGUxZmZmZiA6IHJlc2VydmVkCiAgODAzYzBlMjAwMDAtODAzYzBlMmZmZmYg
OiByZXNlcnZlZAogIDgwM2MwZTMwMDAwLTgwM2MwZTNmZmZmIDogcmVzZXJ2ZWQKICA4MDNmY2Ix
MDAwMC04MDNmZmRiZmZmZiA6IHJlc2VydmVkCiAgODAzZmZkYzAwMDAtODAzZmZmZmZmZmYgOiBy
ZXNlcnZlZAoxMDAwMDI2MDAwMDAtMTAwMDAyNjAwZmZmIDogQVJNSDAwMTE6MDAKICAxMDAwMDI2
MDAwMDAtMTAwMDAyNjAwZmZmIDogQVJNSDAwMTE6MDAKMTAwMDAyNjIwMDAwLTEwMDAwMjYyMGZm
ZiA6IEFSTUgwMDExOjAxCiAgMTAwMDAyNjIwMDAwLTEwMDAwMjYyMGZmZiA6IEFSTUgwMDExOjAx
CjEwMDAwMjZiMDAwMC0xMDAwMDI2YmZmZmYgOiBBUE1DMEQwRjowMAogIDEwMDAwMjZiMDAwMC0x
MDAwMDI2YmZmZmYgOiBBUE1DMEQwRjowMAoxMDAwMDI3MzAwMDAtMTAwMDAyNzMwZmZmIDogYXJj
aF9tZW1fdGltZXIKMTAwMDAyN2MwMDAwLTEwMDAwMjdjMGZmZiA6IHNic2EtZ3dkdC4wCiAgMTAw
MDAyN2MwMDAwLTEwMDAwMjdjMGZmZiA6IHNic2EtZ3dkdC4wCjEwMDAwMjdkMDAwMC0xMDAwMDI3
ZDBmZmYgOiBzYnNhLWd3ZHQuMAogIDEwMDAwMjdkMDAwMC0xMDAwMDI3ZDBmZmYgOiBzYnNhLWd3
ZHQuMAoxMDAwMTAwMDAwMDAtMTAwMDEzZmZmZmZmIDogQVJNSEM2MDA6MDAKICAxMDAwMTI1MDAw
MDAtMTAwMDEzZmZmZmZmIDogQVJNSEM2MDA6MDAKMTAwMDhjMDAwYTAwLTEwMDA4YzAwMGJmZiA6
IEFSTUhENjIwOjAwCjIwMDAwMDAwMDAwMC0yM2ZmZGZmZmZmZmYgOiBQQ0kgQnVzIDAwMDI6MDAK
ICAyMDAwMDAwMDAwMDAtMjAwMDAwMWZmZmZmIDogUENJIEJ1cyAwMDAyOjAxCiAgMjAwMDAwMjAw
MDAwLTIwMDAwMDNmZmZmZiA6IFBDSSBCdXMgMDAwMjowMgogIDIwMDAwMDQwMDAwMC0yMDAwMDA1
ZmZmZmYgOiBQQ0kgQnVzIDAwMDI6MDMKICAyMDAwMDA2MDAwMDAtMjAwMDAwN2ZmZmZmIDogUENJ
IEJ1cyAwMDAyOjA0CjIzZmZlMDAwMDAwMC0yM2ZmZTAwMWZmZmYgOiBhcm0tc21tdS12My40LmF1
dG8KICAyM2ZmZTAwMDAwMDAtMjNmZmUwMDAwZGZmIDogYXJtLXNtbXUtdjMuNC5hdXRvCiAgMjNm
ZmUwMDEwMDAwLTIzZmZlMDAxMGRmZiA6IGFybS1zbW11LXYzLjQuYXV0bwoyM2ZmZjAwMDAwMDAt
MjNmZmZmZmZmZmZmIDogUENJIEVDQU0KMjQwMDAwMDAwMDAwLTI3ZmZkZmZmZmZmZiA6IFBDSSBC
dXMgMDAwMzowMAogIDI0MDAwMDAwMDAwMC0yNDAwMDAxZmZmZmYgOiBQQ0kgQnVzIDAwMDM6MDEK
ICAyNDAwMDAyMDAwMDAtMjQwMDAwM2ZmZmZmIDogUENJIEJ1cyAwMDAzOjAyCiAgMjQwMDAwNDAw
MDAwLTI0MDAwMDdmZmZmZiA6IFBDSSBCdXMgMDAwMzowMwogICAgMjQwMDAwNDAwMDAwLTI0MDAw
MDQ3ZmZmZiA6IDAwMDM6MDM6MDAuMAogICAgMjQwMDAwNDgwMDAwLTI0MDAwMDRmZmZmZiA6IDAw
MDM6MDM6MDAuMAogICAgMjQwMDAwNTAwMDAwLTI0MDAwMDU3ZmZmZiA6IDAwMDM6MDM6MDAuMQog
ICAgMjQwMDAwNTgwMDAwLTI0MDAwMDVmZmZmZiA6IDAwMDM6MDM6MDAuMQoyN2ZmZTAwMDAwMDAt
MjdmZmUwMDFmZmZmIDogYXJtLXNtbXUtdjMuNS5hdXRvCiAgMjdmZmUwMDAwMDAwLTI3ZmZlMDAw
MGRmZiA6IGFybS1zbW11LXYzLjUuYXV0bwogIDI3ZmZlMDAxMDAwMC0yN2ZmZTAwMTBkZmYgOiBh
cm0tc21tdS12My41LmF1dG8KMjdmZmYwMDAwMDAwLTI3ZmZmZmZmZmZmZiA6IFBDSSBFQ0FNCjI4
MDAwMDAwMDAwMC0yYmZmZGZmZmZmZmYgOiBQQ0kgQnVzIDAwMDQ6MDAKICAyODAwMDAwMDAwMDAt
MjgwMDAwMWZmZmZmIDogUENJIEJ1cyAwMDA0OjAxCiAgMjgwMDAwMjAwMDAwLTI4MDAwMDNmZmZm
ZiA6IFBDSSBCdXMgMDAwNDowMwogIDI4MDAwMDQwMDAwMC0yODAwMDA1ZmZmZmYgOiBQQ0kgQnVz
IDAwMDQ6MDQKMmJmZmUwMDAwMDAwLTJiZmZlMDAxZmZmZiA6IGFybS1zbW11LXYzLjYuYXV0bwog
IDJiZmZlMDAwMDAwMC0yYmZmZTAwMDBkZmYgOiBhcm0tc21tdS12My42LmF1dG8KICAyYmZmZTAw
MTAwMDAtMmJmZmUwMDEwZGZmIDogYXJtLXNtbXUtdjMuNi5hdXRvCjJiZmZmMDAwMDAwMC0yYmZm
ZmZmZmZmZmYgOiBQQ0kgRUNBTQoyYzAwMDAwMDAwMDAtMmZmZmRmZmZmZmZmIDogUENJIEJ1cyAw
MDA1OjAwCiAgMmMwMDAwMDAwMDAwLTJjMDAwMDFmZmZmZiA6IFBDSSBCdXMgMDAwNTowMQogIDJj
MDAwMDIwMDAwMC0yYzAwMDAzZmZmZmYgOiBQQ0kgQnVzIDAwMDU6MDIKICAyYzAwMDA0MDAwMDAt
MmMwMDAwNWZmZmZmIDogUENJIEJ1cyAwMDA1OjAzCiAgMmMwMDAwNjAwMDAwLTJjMDAwMDdmZmZm
ZiA6IFBDSSBCdXMgMDAwNTowNAoyZmZmZTAwMDAwMDAtMmZmZmUwMDFmZmZmIDogYXJtLXNtbXUt
djMuNy5hdXRvCiAgMmZmZmUwMDAwMDAwLTJmZmZlMDAwMGRmZiA6IGFybS1zbW11LXYzLjcuYXV0
bwogIDJmZmZlMDAxMDAwMC0yZmZmZTAwMTBkZmYgOiBhcm0tc21tdS12My43LmF1dG8KMmZmZmYw
MDAwMDAwLTJmZmZmZmZmZmZmZiA6IFBDSSBFQ0FNCjMwMDAwMDAwMDAwMC0zM2ZmZGZmZmZmZmYg
OiBQQ0kgQnVzIDAwMGM6MDAKICAzMDAwMDAwMDAwMDAtMzAwMDAwMWZmZmZmIDogUENJIEJ1cyAw
MDBjOjAxCiAgMzAwMDAwMjAwMDAwLTMwMDAwMDNmZmZmZiA6IFBDSSBCdXMgMDAwYzowMgogIDMw
MDAwMDQwMDAwMC0zMDAwMDA1ZmZmZmYgOiBQQ0kgQnVzIDAwMGM6MDMKICAzMDAwMDA2MDAwMDAt
MzAwMDAwN2ZmZmZmIDogUENJIEJ1cyAwMDBjOjA0CjMzZmZlMDAwMDAwMC0zM2ZmZTAwMWZmZmYg
OiBhcm0tc21tdS12My4wLmF1dG8KICAzM2ZmZTAwMDAwMDAtMzNmZmUwMDAwZGZmIDogYXJtLXNt
bXUtdjMuMC5hdXRvCiAgMzNmZmUwMDEwMDAwLTMzZmZlMDAxMGRmZiA6IGFybS1zbW11LXYzLjAu
YXV0bwozM2ZmZjAwMDAwMDAtMzNmZmZmZmZmZmZmIDogUENJIEVDQU0KMzQwMDAwMDAwMDAwLTM3
ZmZkZmZmZmZmZiA6IFBDSSBCdXMgMDAwZDowMAogIDM0MDAwMDAwMDAwMC0zNDAwMDAxZmZmZmYg
OiBQQ0kgQnVzIDAwMGQ6MDEKICAzNDAwMDAyMDAwMDAtMzQwMDAwM2ZmZmZmIDogUENJIEJ1cyAw
MDBkOjAyCiAgMzQwMDAwNDAwMDAwLTM0MDAwMDVmZmZmZiA6IFBDSSBCdXMgMDAwZDowMwogIDM0
MDAwMDYwMDAwMC0zNDAwMDA3ZmZmZmYgOiBQQ0kgQnVzIDAwMGQ6MDQKMzdmZmUwMDAwMDAwLTM3
ZmZlMDAxZmZmZiA6IGFybS1zbW11LXYzLjEuYXV0bwogIDM3ZmZlMDAwMDAwMC0zN2ZmZTAwMDBk
ZmYgOiBhcm0tc21tdS12My4xLmF1dG8KICAzN2ZmZTAwMTAwMDAtMzdmZmUwMDEwZGZmIDogYXJt
LXNtbXUtdjMuMS5hdXRvCjM3ZmZmMDAwMDAwMC0zN2ZmZmZmZmZmZmYgOiBQQ0kgRUNBTQozODAw
MDAwMDAwMDAtM2JmZmRmZmZmZmZmIDogUENJIEJ1cyAwMDAxOjAwCiAgMzgwMDAwMDAwMDAwLTM4
MDAwMDFmZmZmZiA6IFBDSSBCdXMgMDAwMTowMQogIDM4MDAwMDIwMDAwMC0zODAwMDAzZmZmZmYg
OiBQQ0kgQnVzIDAwMDE6MDIKICAzODAwMDA0MDAwMDAtMzgwMDAwNWZmZmZmIDogUENJIEJ1cyAw
MDAxOjAzCiAgMzgwMDAwNjAwMDAwLTM4MDAwMDdmZmZmZiA6IFBDSSBCdXMgMDAwMTowNAozYmZm
ZTAwMDAwMDAtM2JmZmUwMDFmZmZmIDogYXJtLXNtbXUtdjMuMi5hdXRvCiAgM2JmZmUwMDAwMDAw
LTNiZmZlMDAwMGRmZiA6IGFybS1zbW11LXYzLjIuYXV0bwogIDNiZmZlMDAxMDAwMC0zYmZmZTAw
MTBkZmYgOiBhcm0tc21tdS12My4yLmF1dG8KM2JmZmYwMDAwMDAwLTNiZmZmZmZmZmZmZiA6IFBD
SSBFQ0FNCjNjMDAwMDAwMDAwMC0zZmZmZGZmZmZmZmYgOiBQQ0kgQnVzIDAwMDA6MDAKICAzYzAw
MDAwMDAwMDAtM2MwMDAwMWZmZmZmIDogUENJIEJ1cyAwMDAwOjAxCiAgM2MwMDAwMjAwMDAwLTNj
MDAwMDNmZmZmZiA6IFBDSSBCdXMgMDAwMDowMgogIDNjMDAwMDQwMDAwMC0zYzAwMDA1ZmZmZmYg
OiBQQ0kgQnVzIDAwMDA6MDMKICAzYzAwMDA2MDAwMDAtM2MwMDAwN2ZmZmZmIDogUENJIEJ1cyAw
MDAwOjA0CjNmZmZlMDAwMDAwMC0zZmZmZTAwMWZmZmYgOiBhcm0tc21tdS12My4zLmF1dG8KICAz
ZmZmZTAwMDAwMDAtM2ZmZmUwMDAwZGZmIDogYXJtLXNtbXUtdjMuMy5hdXRvCiAgM2ZmZmUwMDEw
MDAwLTNmZmZlMDAxMGRmZiA6IGFybS1zbW11LXYzLjMuYXV0bwozZmZmZjAwMDAwMDAtM2ZmZmZm
ZmZmZmZmIDogUENJIEVDQU0K
--0000000000004251cb05c4dc0b82--
