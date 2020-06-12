Return-Path: <jailhouse-dev+bncBD7236HKXYJRBDMZRX3QKGQEDUV77SI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vs1-xe3e.google.com (mail-vs1-xe3e.google.com [IPv6:2607:f8b0:4864:20::e3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 5895E1F761B
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Jun 2020 11:36:14 +0200 (CEST)
Received: by mail-vs1-xe3e.google.com with SMTP id o2sf1123062vsq.18
        for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Jun 2020 02:36:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591954573; cv=pass;
        d=google.com; s=arc-20160816;
        b=gpX2hzwprWfP+W6IP2qd2+qQQMG42X1r93pVEPiNv6BXQ8NIr68z3BzcrQDcPxWI6k
         GRIypKjrqglnCdIdQexI0wzpq8sy5whtSQJ8gRwr7EbYu2OuFjcx04SN9If1OWMIbBBT
         a4VMLkRh9mld62YYStNr5Ua4WYXKmJFmZ+D7o5OcRrIDZJG5DqN9DQp/iwHtJjQpZ6RJ
         ExZfF5FgR+ZCdPghl9HuRzb/NAsutAdnMFsnSbWkUR4x/Gyy8wY28mnfnShPFZJ9yLsg
         ec/9EJTM4Wv3N0tPoV+NQ2liaH3BhBghxjlXMPmxcAZqmCpwx58LhrfjQC53lPoIzQTi
         VfhQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=EkWXFWlf2OHf0+QGr2De7JSt0cEU14rqBlR5QzEukRM=;
        b=pCsNW19Mjuz3Xjj/4gp+i5mFBmm5//iXhD6zHg7f1rBo7wuV3n/eH3O9Iif/FZ0mNT
         A6xNHdbyq7uzJGUft4+8/YYRM5yrftprQituhh8LcYpm3hRRwNoGh3CZNOoG17GnuJhX
         nh125i012MwnozrgClcKOB+SloK7Z1kC/kfjMJ4yt+wnFtpeMtv/1GF/xt7TY/pet3gR
         TAZt1yMVAa7ClFuik9zi1fyw52mtSiiqZ1GSjpSK+Tr8XwG7PLBvwajrROBqrRsubFCS
         Zj9k0Bt1AF3qovEShRAsrLGEoXMPq8rBntsW+GXwsLz+bT/CUJAFd9gRExnStqvdWqMJ
         i1eQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=eqRNJ7No;
       spf=pass (google.com: domain of contact.thorsten@gmail.com designates 2607:f8b0:4864:20::135 as permitted sender) smtp.mailfrom=contact.thorsten@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=EkWXFWlf2OHf0+QGr2De7JSt0cEU14rqBlR5QzEukRM=;
        b=ahjxkjcgOjbGkolDD592GJ/lmjwatvaFsmzX6pPiOmIkhlbxBEtpUWNulp/WSkWamB
         Dsw9va+4N9kH27oF4RKEoPJgBUYWhwwbJnl+3zlSqGVARSH/lUPeqb0CqaDrU896FjI8
         WFUCGgQZhkutc6s/1VlpEtN+rY3uzIR7+mt3zrmWC2GgoRBwsQipACMej5lj1tOaIUBV
         MM7CKzGWGe8FsdUWFvjskKGALArU5fwDBshcmJV9kBdpp0jX0vZ7eoowN9wA48tmXyuE
         C9MAw/0uEZOtWcZm5U5POKN1+vr/lRMxn/XCpiXC+iDPaUJ+h7X8who0MGv9RWxt09C9
         RNig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=EkWXFWlf2OHf0+QGr2De7JSt0cEU14rqBlR5QzEukRM=;
        b=BnlCr66iEMiET1b1+KPWw6ANLjmhD6RtRdC+HqtOivk640VpjqQ4CfXDHatwzOZZj3
         v4975jXyRUKvxC8B8Fc796mlheujpC3YyOy2Sa6qAF/vGN6W9u8yJC0PfOACpZoRk3Zh
         ZuuNN/kRlv6cWb/qp+n/lF9a9+2/DRShmMsJGYXgPn7ZBu3f6A0iQ0leHmueaUgfm12J
         rCWjlhOQ0JL26lUQyCHGgi5GwpUZPmDz2+EH1uecoTC3v0zCurwHMkDV9iZj52mjOwlE
         5xza3fKA9byY8UtDTEp/rSMSLi49XuTEdXBUloonHjpFx5auSBQ/5OzLpzoQiKZW8/97
         w+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=EkWXFWlf2OHf0+QGr2De7JSt0cEU14rqBlR5QzEukRM=;
        b=pkuCnbzJOi3voNge1eMfDtVE3TWQjCYsX/8MCPcIsBHy4iH0yARidsU2pObnvZMfTG
         gHGj2fRM3sT51MvNVpTCkScjsmQckLgPIINl9X7vZoDUgZczMv8w5eJgze+aesmo/xPr
         Dn8/KPzImgBKR7y3p9uORCgt+NWJWN/L3BdnXwKb+g/itVyBH15AHN8P0tUMdq6jY/OC
         ZoBvGq25tJ67MfGA46xFxxqafnsDUT46wiiYaKopSGTlViqpD0wNeATKMkl/DlLk6SoK
         GkkoGIYC23oeKLZMUGUcJs9HUa0bNiudGe9UiLZqWxmBW1hM/+pt+6ivOSf0CCspUhui
         b0RQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531VSWNAGE8x9s5V9bgEMu4+LMP6LeGhRsyWUa/V9Vv3XtsT0Ll4
	RXoEOtnj6zQEVUAlLKaXmNQ=
X-Google-Smtp-Source: ABdhPJxIeGdIf7uGgJ65ZiHNgQWfgPYTUInRbXQCaRQdKBTqeHo5ZP4euLPS4xCaXdQWbkVI9u4sgg==
X-Received: by 2002:a67:e156:: with SMTP id o22mr9729757vsl.239.1591954573356;
        Fri, 12 Jun 2020 02:36:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a67:fc16:: with SMTP id o22ls596293vsq.3.gmail; Fri, 12 Jun
 2020 02:36:12 -0700 (PDT)
X-Received: by 2002:a05:6102:205d:: with SMTP id q29mr10396469vsr.130.1591954572804;
        Fri, 12 Jun 2020 02:36:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591954572; cv=none;
        d=google.com; s=arc-20160816;
        b=bn5+oy68+bznOA3iQAhwqcb8OOKv4Eg2k7s2y79mILYbZZnrFDAnUHVuHPejbLAd8u
         fRTEWmRBclmhUSNUgygHF7Sk3ZiyEx2u3IpGXwVWD6JEjzG0Io3CnvC/IgWccyRX2n3K
         5nyxjG/tL2KTVTimEfQtFMSRIP6BjROH95PeEBJMG74FZmVAoxVAwpehF2tyHbXPgKy5
         mPM3lq8CTkSoRX89JKUnFhYO9gBdgOPNwpeMgNS/RHiXbZP5GdKnxwGYmhYjFO5QCRaj
         ZiDRsDXTXXzdQqzETrQCOxLUmj6WT1rAQhRP3N1pHDRxV5444z8G2AnaL65qjTOycz3B
         fD4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cYFYKkRHYjt1pb359iDIGiqbDoxJMMj6W/xxlv7YLT8=;
        b=FAymFS494zO8F9xJ5I8W9yrnmDpZtZY+qg2z9zqZvLs0r57Fvr/mEGxNl8uiNj+O5d
         j7++Xzk+WX1ARs4FeRLtHFe7xRcSKoMtdwBSyHP93vUFJzLVaqGZscVWn3dX2GFyb1xv
         kL3w5kn/qp4nfT4qKp0JbJxXlQkwwrsKVUYY1PvOHQizYctmRLJQJB+HcIgXDq2ZeaqD
         PzU5Z0kCp8e5ivie5ovNJkxi12jDmo05IdfbB6eCUzL98+k/HSfCt/nesQg/sL4QzP6A
         H7Ylm9gJ2EAL0T7OLtKuUo7j2AVqNaCYo/oPy15vy5WdxFxOSD+AcxRnjTmNme3FO8RG
         MB3w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=eqRNJ7No;
       spf=pass (google.com: domain of contact.thorsten@gmail.com designates 2607:f8b0:4864:20::135 as permitted sender) smtp.mailfrom=contact.thorsten@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com. [2607:f8b0:4864:20::135])
        by gmr-mx.google.com with ESMTPS id f12si282567vsr.0.2020.06.12.02.36.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2020 02:36:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of contact.thorsten@gmail.com designates 2607:f8b0:4864:20::135 as permitted sender) client-ip=2607:f8b0:4864:20::135;
Received: by mail-il1-x135.google.com with SMTP id h3so8178018ilh.13
        for <jailhouse-dev@googlegroups.com>; Fri, 12 Jun 2020 02:36:12 -0700 (PDT)
X-Received: by 2002:a92:ca92:: with SMTP id t18mr12715371ilo.132.1591954572489;
 Fri, 12 Jun 2020 02:36:12 -0700 (PDT)
MIME-Version: 1.0
References: <9b648b5a-97c7-473f-8631-d55064a5b69fo@googlegroups.com> <e4a04bc1-1254-5d12-05b7-cbd717815078@siemens.com>
In-Reply-To: <e4a04bc1-1254-5d12-05b7-cbd717815078@siemens.com>
From: Thorsten Schulz <contact.thorsten@gmail.com>
Date: Fri, 12 Jun 2020 11:36:00 +0200
Message-ID: <CAJxPjDwf667o3SHfPLmq8e9z72nMSLsZV6SWk+byEtk61ghXmA@mail.gmail.com>
Subject: Re: Reboot root cell
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Pratik Patil <prtptl.smilingcorpse@gmail.com>, 
	Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="000000000000cab97005a7dfced6"
X-Original-Sender: contact.thorsten@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=eqRNJ7No;       spf=pass
 (google.com: domain of contact.thorsten@gmail.com designates
 2607:f8b0:4864:20::135 as permitted sender) smtp.mailfrom=contact.thorsten@gmail.com;
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

--000000000000cab97005a7dfced6
Content-Type: text/plain; charset="UTF-8"

I found this an interesting question, thanks Jan for the concise (yet
possibly obvious) reply. Pratik probably has a different usecase, however,
a little side-note here.

To comment in general for others reading this:
This is quite important for the system architecture considerations. So
everything that could foreseeably require a reboot during run-time (e.g.
everything that could require a security patch/update due to a CVE) must
reside in a non-root cell for this basic reason.
Example: In my setups in the past weeks and months I have considered the
root-cell only for setup and "health-monitoring" - esp. *not* connected to
the outer world. (* in theory ;) ) All functions and interactions and
ETH-cards are actually in Non-Root cells.

just my 50ct,
Thorsten

Am Fr., 12. Juni 2020 um 08:38 Uhr schrieb Jan Kiszka <
jan.kiszka@siemens.com>:

> On 12.06.20 02:57, Pratik Patil wrote:
> > Hello everyone,
> > Can anyone help me with this problem:
> > Is it possible to reboot root cell without stopping operation in
> non-root cell?
> >
>
> This is not supported because Jailhouse freezes all resources that the
> root cell initialized during its boot, and rebooting the cell would be
> in conflict with that, specifically if those are shared resources,
> affecting also the non-root cells.
>
> But you can reload and, thus, restart non-root cells.
>
> Jan
>
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux
>
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/e4a04bc1-1254-5d12-05b7-cbd717815078%40siemens.com
> .
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAJxPjDwf667o3SHfPLmq8e9z72nMSLsZV6SWk%2BbyEtk61ghXmA%40mail.gmail.com.

--000000000000cab97005a7dfced6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I found this an interesting question, thanks Jan for =
the concise (yet possibly obvious) reply. Pratik probably has a different u=
secase, however, a little side-note here.<br></div><div><br></div><div>To c=
omment in general for others reading this:<br>This is quite important for t=
he system architecture considerations. So everything that could foreseeably=
 require a reboot during run-time (e.g. everything that could require a sec=
urity patch/update due to a CVE) must reside in a non-root cell for this ba=
sic reason.<br></div><div>Example: In my setups in the past weeks and month=
s I have considered the root-cell only for setup and &quot;health-monitorin=
g&quot; - esp. <i>not</i> connected to the outer world. (* in theory ;) ) A=
ll functions and interactions and ETH-cards are actually in Non-Root cells.=
</div><div><br></div><div>just my 50ct,<br></div><div>Thorsten<br></div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Am =
Fr., 12. Juni 2020 um 08:38=C2=A0Uhr schrieb Jan Kiszka &lt;<a href=3D"mail=
to:jan.kiszka@siemens.com">jan.kiszka@siemens.com</a>&gt;:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">On 12.06.20 02:57, Pratik Patil =
wrote:<br>
&gt; Hello everyone,<br>
&gt; Can anyone help me with this problem: <br>
&gt; Is it possible to reboot root cell without stopping operation in non-r=
oot cell? <br>
&gt; <br>
<br>
This is not supported because Jailhouse freezes all resources that the<br>
root cell initialized during its boot, and rebooting the cell would be<br>
in conflict with that, specifically if those are shared resources,<br>
affecting also the non-root cells.<br>
<br>
But you can reload and, thus, restart non-root cells.<br>
<br>
Jan<br>
<br>
-- <br>
Siemens AG, Corporate Technology, CT RDA IOT SES-DE<br>
Corporate Competence Center Embedded Linux<br>
<br>
-- <br>
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com" tar=
get=3D"_blank">jailhouse-dev+unsubscribe@googlegroups.com</a>.<br>
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/e4a04bc1-1254-5d12-05b7-cbd717815078%40siemens.com=
" rel=3D"noreferrer" target=3D"_blank">https://groups.google.com/d/msgid/ja=
ilhouse-dev/e4a04bc1-1254-5d12-05b7-cbd717815078%40siemens.com</a>.<br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAJxPjDwf667o3SHfPLmq8e9z72nMSLsZV6SWk%2BbyEtk61gh=
XmA%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CAJxPjDwf667o3SHfPLmq8e9z72nMSLsZV6SWk%2B=
byEtk61ghXmA%40mail.gmail.com</a>.<br />

--000000000000cab97005a7dfced6--
