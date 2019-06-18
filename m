Return-Path: <jailhouse-dev+bncBCC7DQPESQPRBU5VUTUAKGQEA3AZNEQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x637.google.com (mail-pl1-x637.google.com [IPv6:2607:f8b0:4864:20::637])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C094A7E8
	for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Jun 2019 19:09:41 +0200 (CEST)
Received: by mail-pl1-x637.google.com with SMTP id b24sf8157462plz.20
        for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Jun 2019 10:09:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560877780; cv=pass;
        d=google.com; s=arc-20160816;
        b=zGij7zsEMoSfx4PCXqg5n9VE0LQQLXFiByet+yTbjyvCTyGv0DDgmg4tVlC89KcDF5
         EI1JwPfuy9VGba1h99x3TRq06uadqgJkdeZcjz/2OygkwudLZwRYl8E6W2NzbMLnwph4
         Yme7Ehm4NHu/Ia1wqyOor+Z81x/pkL5oxgXZhzGRhz0Hnm5DpoeBjqhU8cVHpImLNRZf
         WqYpsvxRcTl62S5CiV9vNvWNHBb+qqJXKFkQFEuhFmM7prI+jafjyUbUByta2SPk89C9
         tJDV2Fdf64nVGOyr638aDqQPxfSOqfJMND5QQDI0iTG+eiDAlG8o/z+aenRegjwjoDro
         AJBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=dw6mXjx21IXM/dzhZgS+vHBNT9bEzG+kml73SQmZ5WY=;
        b=CwF33uJXNJUi1PafpJgRPenUY6+a4Jm5GXVQr14j/lFOHiqZpMmxYwFSkcBfJUUJqo
         5XKZvo8EwNPBQLTlBlYfP8SZlw4Sr0lbIyK1svBvrJxb/P5Psu8T1sETmyigGGWoML2/
         j6TDgxUiffWZhovH1QKMgH2LN6VRfGcRmzRFw/TKEI+C+hnoib5fwfeYeiB/VjNIY+FO
         yxSxZ3FvzfD8oiCPTVbbesp2mdpdAfd65rg9r4nz9ssGoz9EBGLxHHqj8i1BQR9oiSeO
         BybztHEloRmdYj95aa2fNOrGzBOFcGc501zy+p0IZe9AxI1w8sgyOYEp70mA10yI3/5Y
         knxw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=VWgCS1in;
       spf=pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::741 as permitted sender) smtp.mailfrom=racedrive1503@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dw6mXjx21IXM/dzhZgS+vHBNT9bEzG+kml73SQmZ5WY=;
        b=XfmqXg2mGMmd5lA9H8vfVGg/l9qDhI5WTaa0xV8M388Q4jTVKyVC5M7bF3+FC9BqVs
         gfLiwdBMwEFB6D8R4/T5mcNlFasHVyHFNmDNoSf9rcw8quceV94lZI7dujciA8JE4KIZ
         Q0BDrO3OhWNiUWD6fWSfV9sYs9U3MAp7FIOdMp6qY3r2eBC8InsxS1ILkjdFG0pSEOzk
         xiVN4mpVAPgaSezcDQ68x3UHasIvrbSBgiaZu4aYu14quQgZfBVVyAlHnPhaHmd0KYYD
         KYFZJm2d/NcZEYJdmQFMJpZ3fxbS/p8/pNG2jQy7nMR3FAIY8FBclccbgGB5ENrZ75if
         vu9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dw6mXjx21IXM/dzhZgS+vHBNT9bEzG+kml73SQmZ5WY=;
        b=mtZi1EundCf0QLhafYSnKXfvUBv0+LRzc9pKRxyMLzygPOh6T7ADkNiPJiLs6IRRMV
         w+TS4yaSaEY0E5vNP51ZggYfnE1czIv33A+LDqfyrPg8muSmhiaStugt/9+epESpacR9
         br/MetIiyl3Hns4hXt6Weq3YGRNX2XtxDK+IBsctY6E6kyfzvrQ9ise5VLvYR1eu4iME
         itbbUXf3ID0Z5KlHjNB9tlJS7w8u/Z0KZnb2gKS53Cj5rfi/8cjS1fC1O7MbhZuZnqt7
         a8qf8QFLZtyWeAgSqFdbmuWBpmsqDDk2SiZ+ZiXC2OJBqGpllr+IY3v3CZx1fBbp1/Br
         RX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dw6mXjx21IXM/dzhZgS+vHBNT9bEzG+kml73SQmZ5WY=;
        b=eLZSGDTQvhn3XQn16D14Wn/Q6NDn8NczTUkMmswhN5ylco0BVGtApegneUaEMTPvAE
         UEpC4Z5bu1RxgIqrDdYEG3CfWdnf6mzE3N+gWKOUvRBlUIwc9iM/pK2E4BU2EWnDQwtw
         5cBS3E432M3WXlZ+py7Y3DVBgL72bhMtLYiY4cVE+kxV5ej/wjTMIUTsTqln213cMzQd
         mKkvho1o/4HO+2inL4xnSV6EEQtzapl6aRqhANkMsDn5KdqlLQ8MreyXB1R4tXCDasqn
         6baN3c6Oc1kwtyUHrCmksWtgMomYMJbEfFHYGpWdEBqRE9dHlq7kioE1qqpzUZmfPyb1
         qVNw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUFwlNL2heJO6hQohrT7yOM3q9/R0Oqzo7xtLp3RRGhJ0PwWYxc
	UOSCC0+DIzNRusEjpcevFvQ=
X-Google-Smtp-Source: APXvYqx45J4K6o9QyUWBcSdkareNQrX+bfCJDj3zdzPsueTZXXiv+3mvNu98NV8pIsNwnx3TSqUqyg==
X-Received: by 2002:a17:90a:290b:: with SMTP id g11mr6229136pjd.122.1560877780051;
        Tue, 18 Jun 2019 10:09:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:3662:: with SMTP id s89ls453456pjb.1.canary-gmail;
 Tue, 18 Jun 2019 10:09:39 -0700 (PDT)
X-Received: by 2002:a17:902:6a4:: with SMTP id 33mr9274029plh.338.1560877779335;
        Tue, 18 Jun 2019 10:09:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560877779; cv=none;
        d=google.com; s=arc-20160816;
        b=h1mp9lyecBPvFj0scBjWzzadVvO3L0ItQEcFeoMS7N84Iu7KpbfBfQJ91RgweSKHmU
         6GqlZ9hLmiV6dWKCR/HYEaRsI7c80NCHO5nVkP4zokiMqBY16TcGquRnZbputkXsXgze
         tbo4yQ0/tQrR5h2NVeaJYQkTgypU+Z6QQt3FefzUXD5ka9OAt2rwO9LqajYAzeRSoGM3
         fx8xVj2J7qXEiY3f2qyA/ZEgIY7Sz3w1CmB+z2lBBjphRyh6YNwW6GBINSFO3ScmgZS7
         vdqIk3sXsCsMjDEccceZCoH/q9RQ7zuR9Fw9e1GugB40zRORzOK+RGw/Plgn8Cc/3CxV
         S4qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qg6E12rucmAJUCaLIXHYyN8roMid2fxaprrBK5bjr2w=;
        b=0tUo0WoJ3cKR6/ATTvDrl0LynsNT4Y6eptnPnfAOTE0aXk40FtSZl1HovCBBU5x8BS
         jqYP92R2ygmvfTw6wAWHORKxnEh6HFetgKetWwaM4XhY6HEpg1cCCorTq9Au6Oc2O8Yc
         nUPLioOfi/tDufzkBqxRsmwpK1ox+bn47sa9SqfGdbxLtw5/YGpAeqPDjreLZ9x4RVvl
         lIujmh+krg6UXFKFjCApNQLk4M/eJGcDxkO8L3bMYoC4GZZAv1LHLBRtrDI6FKDwkRnB
         WGGsTPFJIz9zISJLAS+JaftoZHacsEjZb/5xBF14DDiHYbPWkzNE0RAGfGIss1nGKyej
         WcwA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=VWgCS1in;
       spf=pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::741 as permitted sender) smtp.mailfrom=racedrive1503@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com. [2607:f8b0:4864:20::741])
        by gmr-mx.google.com with ESMTPS id d128si570567pgc.5.2019.06.18.10.09.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2019 10:09:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::741 as permitted sender) client-ip=2607:f8b0:4864:20::741;
Received: by mail-qk1-x741.google.com with SMTP id b18so9039629qkc.9
        for <jailhouse-dev@googlegroups.com>; Tue, 18 Jun 2019 10:09:39 -0700 (PDT)
X-Received: by 2002:a37:aac5:: with SMTP id t188mr94880669qke.157.1560877778564;
 Tue, 18 Jun 2019 10:09:38 -0700 (PDT)
MIME-Version: 1.0
References: <CA++Khc2iKk1J6+0huh5__dS4HyujXzV9r+LbKLzuVZ4K3Bt5eA@mail.gmail.com>
 <CA++Khc13nuahbog_WVD-BJi0asHEa8TxMAvB5M5damJGJ_5inA@mail.gmail.com>
 <d2e2b271-4e43-4126-5433-8304d4984e7a@oth-regensburg.de> <CA++Khc2LGq3gGydG2Ojxn2xcbPoc6VzvhoO4_ikFMFMdQ_aYOg@mail.gmail.com>
 <bd92264a-60c1-6f76-07f0-93cb9bd08a01@siemens.com> <CA++Khc0seBDnN2hD7EJh3g25unUEFqBuiRSm5HwOE+1JEX0D2Q@mail.gmail.com>
 <63552042-48d0-cb32-e893-28ae4ab29ccd@siemens.com> <CA++Khc3Mj=SFen+_f7RE5g1Paq1AhHQOrBX3HqNoJvvbymQh0w@mail.gmail.com>
 <5b90a899-c42a-a360-8398-c3af35920765@siemens.com> <CA++Khc0whU3=U86WGNEtLUZoOkKuYLiEA+nqOjW1UFcRDeGTRQ@mail.gmail.com>
 <0da95034-9bd0-4415-4d3b-5f6687a84563@siemens.com> <CA++Khc1Xjt8yMT39shFraJnzSWp8Ctc9-Cv-mNxOqf+UkxhyxA@mail.gmail.com>
 <36306f60-8b63-f32d-2559-3a1ca6f53e87@siemens.com> <CA++Khc3hURr3dFrw2ga=uf9A02KZ1OEEtMAPOVJyCAP3Fs+fmw@mail.gmail.com>
 <889c96a9-a7dc-4385-28e5-437fbc4d5008@siemens.com> <CA++Khc2-Cv==+eJCS8cN-ShK7q==Qs7UpW-ZfoUcEZ2Tam5c7Q@mail.gmail.com>
 <3bb0abe5-55ca-b9b5-edff-6bc8d0ef85af@siemens.com>
In-Reply-To: <3bb0abe5-55ca-b9b5-edff-6bc8d0ef85af@siemens.com>
From: Wayne <racedrive1503@gmail.com>
Date: Tue, 18 Jun 2019 13:09:26 -0400
Message-ID: <CA++Khc2YjAfFL1x-uU_N9FoUhZUMSsKQ2bKHAbd17U=HA_90Nw@mail.gmail.com>
Subject: Re: Linux non-root node question
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="000000000000877bed058b9c2d06"
X-Original-Sender: racedrive1503@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=VWgCS1in;       spf=pass
 (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::741
 as permitted sender) smtp.mailfrom=racedrive1503@gmail.com;       dmarc=pass
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

--000000000000877bed058b9c2d06
Content-Type: text/plain; charset="UTF-8"

Jan:

To summarize:
1. My smaller guest initramfs (~30MB) unpacks properly, but then falls into
the dracut emergency shell.  Now that i'm using minicom it no longer
scrolls repeatedly.  I still can't get to a proper kernel login prompt.
2. My larger root initramfs (~70MB) fails to unpack, and also jailhouse
fails to create the guest if I attempt to allocate more memory.
3. I can get to the kernel login prompt (and login successfully) if I use
your rootfs.cpio binary.  This option so far is the most promising.

Thanks for your assistance,
Wayne

On Tue, Jun 18, 2019 at 12:01 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:

> On 18.06.19 17:48, Wayne wrote:
> > Jan/Ralf:
> >
> > Ok, with the rootfs.cpio you just provided I can see the following on my
> serial
> > port:
> >
> > Welcome to Buildroot
> > jailhouse login:
> >
> > So that's progress.  Is there a default user name and password to use to
> > complete the login?  That would point to the problem being booting
> against my
> > initramfs files.
>
> "root" without password is the login.
>
> >
> > Also, the issue where my serial output scrolled continuously was due to
> the
> > capture method.  I switched to minicom and no longer see that occur.
>
> OK, consistent sign. Then we are back to a size issue, not a format
> problem: You
> larger image is too large, but enlarging the inmate does not work. If it
> would,
> your larger image will likely boot as well.
>
> >
> > Any further thoughts on why jailhouse fails to load the guest when I set
> the
> > memory region greater than 200MB?
>
> I need to analyze your config, maybe try it out.
>
> Jan
>
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc2YjAfFL1x-uU_N9FoUhZUMSsKQ2bKHAbd17U%3DHA_90Nw%40mail.gmail.com.
For more options, visit https://groups.google.com/d/optout.

--000000000000877bed058b9c2d06
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Jan:<div><br></div><div>To summarize:</div><div>1. My smal=
ler guest initramfs (~30MB) unpacks properly, but then falls into the dracu=
t emergency shell.=C2=A0 Now that i&#39;m using minicom it no longer scroll=
s repeatedly.=C2=A0 I still can&#39;t get to a proper kernel login prompt.<=
/div><div>2. My larger root initramfs (~70MB) fails to unpack, and also jai=
lhouse fails to create the guest if I attempt to allocate more memory.</div=
><div>3. I can get to the kernel login prompt (and login successfully) if I=
 use your rootfs.cpio binary.=C2=A0 This option so far is the most promisin=
g.</div><div><br></div><div>Thanks for your assistance,</div><div>Wayne</di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Tue, Jun 18, 2019 at 12:01 PM Jan Kiszka &lt;<a href=3D"mailto:jan.kis=
zka@siemens.com">jan.kiszka@siemens.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On 18.06.19 17:48, Wayne wrote:<br>
&gt; Jan/Ralf:<br>
&gt; <br>
&gt; Ok, with the rootfs.cpio you just provided I can see the following on =
my serial <br>
&gt; port:<br>
&gt; <br>
&gt; Welcome to Buildroot<br>
&gt; jailhouse login:<br>
&gt; <br>
&gt; So that&#39;s progress.=C2=A0 Is there a default user name and passwor=
d to use to <br>
&gt; complete the login?=C2=A0 That would point to the problem being bootin=
g against my <br>
&gt; initramfs files.<br>
<br>
&quot;root&quot; without password is the login.<br>
<br>
&gt; <br>
&gt; Also, the issue where my serial output scrolled continuously was due t=
o the <br>
&gt; capture method.=C2=A0 I switched to minicom and no longer see that occ=
ur.<br>
<br>
OK, consistent sign. Then we are back to a size issue, not a format problem=
: You <br>
larger image is too large, but enlarging the inmate does not work. If it wo=
uld, <br>
your larger image will likely boot as well.<br>
<br>
&gt; <br>
&gt; Any further thoughts on why jailhouse fails to load the guest when I s=
et the <br>
&gt; memory region greater than 200MB?<br>
<br>
I need to analyze your config, maybe try it out.<br>
<br>
Jan<br>
<br>
-- <br>
Siemens AG, Corporate Technology, CT RDA IOT SES-DE<br>
Corporate Competence Center Embedded Linux<br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CA%2B%2BKhc2YjAfFL1x-uU_N9FoUhZUMSsKQ2bKHAbd17U%3D=
HA_90Nw%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://gr=
oups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc2YjAfFL1x-uU_N9FoUhZUMSsKQ=
2bKHAbd17U%3DHA_90Nw%40mail.gmail.com</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--000000000000877bed058b9c2d06--
