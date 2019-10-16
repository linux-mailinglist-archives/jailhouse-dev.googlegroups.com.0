Return-Path: <jailhouse-dev+bncBC2PTC4R4MNBBV7GTHWQKGQEO3VNZWQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x237.google.com (mail-oi1-x237.google.com [IPv6:2607:f8b0:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 23174D8584
	for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Oct 2019 03:33:13 +0200 (CEST)
Received: by mail-oi1-x237.google.com with SMTP id b2sf12794407oie.21
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 18:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=60M1tOtq/7UjmUuG2sX5odJmXSPoUoKwaMPRm4txFCY=;
        b=cwbL8JHNdXSONeuqYGIa+0aEwCskLZmwVPfruYDpF39qyLRvqE7aOKnDZD4Yi2IfLN
         NE/TzrF/wsfqXddAGd79nlnLUpa3lf+47UK8tfwSKrHVRkq7HJ4o+eoNmq7lezdefY6Z
         VSqWSrl9922Ib9x/OhPH64njhZvv0H35OkS4dT/X6D/f6tW40RdfeptiH6cAiXoSO/4W
         QJaYVYfbzugkeNKw1nEYgIcWbX6kOQhWpN38qHYnkTAkOG5epNf103+vAJ5m4pkOOjax
         QCb1JRqhvw7/IC+NGSwd7FiPW0sSpWig3xKM/jbl5sAlgjAYi9v9pyTO9Y6kE+vyEQJu
         5Dyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=60M1tOtq/7UjmUuG2sX5odJmXSPoUoKwaMPRm4txFCY=;
        b=sgfLL49Ft75uwnuAoS8BZQtc+TqK5gbjOZdYA+WjOEUkWK2QWPlpV/16lrx1AO85vj
         su4All3bj6osjTM9zc9+HpikvxWMtH/v6BQfwuBpV+KVFt1tqSTEUvN8wptY2yE5NmkU
         Diy29io5QqTLlphK3LFTdV7+uLM1i3DpsubSOvsmevGUw7rMUgwDOL2t8CR1JwiH2hQx
         I4BkmQUOx9i7GOZkgGI6ZFOtSxSQiWHqZ6qyJfbQIh7PmdWPsm4928BABePy7F7XJUyd
         JrB8l0+8DmWu4OnVCNwy6GR22pnUtMP1kYpCVzyiadmiWI5mVOK5IcCVqFRlXfcRY5mj
         eUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=60M1tOtq/7UjmUuG2sX5odJmXSPoUoKwaMPRm4txFCY=;
        b=kYp8Au5sQnlJFna4H44BYuxHpMr/6bE+iD3p1Sz0aPxKg1RgNHccTn9fHAnUJySNLX
         mni41Dcala9IK3g7xzvKeFF04/2l9GNhSPHZmYIXBvg4QuSgdANFXO17SGWpX3IVbZ8Z
         1d2/l0H6LgTy3zSayVc39yNIJFnal4HRpzbuO25Wthe9qfzUx1ooRjnhwqcNelut0V54
         poH1fN2YKD7P/nqXc5u3NnOguxi+TVs4B2biseZn908bVuciFVp+Ms7d1NnaP3uX88ea
         QMrLVXqBx9BrIbN+aJFhHzeBNhSkZUoPhEAJKEetOg0bIuPEyMps8bDjkrzzMBbYAXVZ
         VoQA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUKMJb0VprcLj6JoIXw1wrpikqs7i9TcIR4nGtkFju8HYTqlo7R
	cFHpsalf7NHk6ogohjpTJ0o=
X-Google-Smtp-Source: APXvYqxJxW4kcTEhC45LdQ9GZ0gQx0kpMeZ59hms6TOH5reo2/q+Tqa7mv9lI7DVNEQ2mVn6Qd+HPw==
X-Received: by 2002:aca:dec4:: with SMTP id v187mr1313982oig.46.1571189591543;
        Tue, 15 Oct 2019 18:33:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:1ad9:: with SMTP id r25ls3157543otc.1.gmail; Tue,
 15 Oct 2019 18:33:10 -0700 (PDT)
X-Received: by 2002:a9d:5a0b:: with SMTP id v11mr22904516oth.274.1571189590550;
        Tue, 15 Oct 2019 18:33:10 -0700 (PDT)
Date: Tue, 15 Oct 2019 18:33:09 -0700 (PDT)
From: Chung-Fan Yang <sonic.tw.tp@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <e67df2f1-0967-453f-97a9-5bc2ea58a790@googlegroups.com>
In-Reply-To: <603922dd-251c-b4ad-f4a0-1397f753a25f@siemens.com>
References: <85f868a4-bff5-567b-fbd1-22c79406ad17@siemens.com>
 <603922dd-251c-b4ad-f4a0-1397f753a25f@siemens.com>
Subject: Re: PoC: virtio over ivshmem for Jailhouse
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4322_571277573.1571189589846"
X-Original-Sender: Sonic.tw.tp@gmail.com
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

------=_Part_4322_571277573.1571189589846
Content-Type: multipart/alternative; 
	boundary="----=_Part_4323_1176276728.1571189589846"

------=_Part_4323_1176276728.1571189589846
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable



2019=E5=B9=B410=E6=9C=8815=E6=97=A5=E7=81=AB=E6=9B=9C=E6=97=A5 16=E6=99=821=
8=E5=88=8639=E7=A7=92 UTC+9 Jan Kiszka:
>
> On 14.10.19 19:04, Jan Kiszka wrote:=20
> > Hi all,=20
> >=20
> > it's still basically a PoC, not yet specified and with a lot of sharp=
=20
> > edges, but it works too well for not being pointed out:=20
> >=20
> > The queues/jailhouse-ivshmem2 branch on [1] contains a virtio-ivshmem=
=20
> > transport driver [2] for Linux front-end guests and a simple virtio=20
> > console backend device model [3], also for Linux. Combining that with=
=20
> > the wip/ivshmem2 branch of Jailhouse, you can call in the root cell=20
> >=20
> > # echo "4a48 4a48 4a48 4a48 ffc003 ffffff" \=20
> >    > /sys/bus/pci/drivers/uio_ivshm/new_id=20
> > # virtio-ivshmem-console /dev/uio0=20
> >=20
> > and then start the Linux demo inmate which uses "console=3Dhvc0". You w=
ill=20
> > both see the (late) boot logs and be able to log into the guest, like i=
t=20
> > were a serial console. And all that without touching anything in=20
> > Jailhouse (beyond generic ivshmem 2.0 support)!=20
> >=20
> > More to come, latest at [4].=20
> >=20
> > Jan=20
> >=20
> > [1] http://git.kiszka.org/linux.git/=20
> > [2]=20
> >=20
> http://git.kiszka.org/?p=3Dlinux.git;a=3Dblob;f=3Ddrivers/virtio/virtio_i=
vshmem.c;hb=3Drefs/heads/queues/jailhouse-ivshmem2=20
> > [3]=20
> >=20
> http://git.kiszka.org/?p=3Dlinux.git;a=3Dblob;f=3Dtools/virtio/virtio-ivs=
hmem-console.c;hb=3Drefs/heads/queues/jailhouse-ivshmem2=20
> > [4] https://sched.co/TmxI=20
> >=20
>
> Was too easy:=20
>
> Welcome to Buildroot=20
> jailhouse login: root=20
> # mount /dev/vda /mnt/=20
> [    8.968669] EXT4-fs (vda): mounted filesystem with ordered data mode.=
=20
> Opts: (null)=20
> # ls -l /mnt/=20
> total 12=20
> drwx------    2 root     root         12288 Oct 14  2019 lost+found=20
>
> You just need [5] and this to make it happen:=20
>
> # dd if=3D/dev/zero of=3Ddisk.img bs=3D1M count=3D64=20
> # mkfs.ext4 disk.img=20
> # echo "4a48 4a48 4a48 4a48 ffc002 ffffff" \=20
>    > /sys/bus/pci/drivers/uio_ivshm/new_id=20
> # virtio-ivshmem-block /dev/uio0 disk.img=20
>
> I've updated the Jailhouse wip/ivshmem2 branch with corresponding cell=20
> configurations.=20
>
> Jan=20
>
> [5]=20
> http://git.kiszka.org/?p=3Dlinux.git;a=3Dblob;f=3Dtools/virtio/virtio-ivs=
hmem-block.c;hb=3Drefs/heads/queues/jailhouse-ivshmem2=20
>
> --=20
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE=20
> Corporate Competence Center Embedded Linux=20
>

This will be very handy.

I am current working on project require custom pipes and serial console=20
between cells.
I have handcrafted the drivers, but if the generic virtio model is adapted,=
=20
it will be much easier, at least for the Linux side.

Yang
=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e67df2f1-0967-453f-97a9-5bc2ea58a790%40googlegroups.com.

------=_Part_4323_1176276728.1571189589846
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>2019=E5=B9=B410=E6=9C=8815=E6=97=A5=E7=81=AB=E6=9B=
=9C=E6=97=A5 16=E6=99=8218=E5=88=8639=E7=A7=92 UTC+9 Jan Kiszka:<blockquote=
 class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1=
px #ccc solid;padding-left: 1ex;">On 14.10.19 19:04, Jan Kiszka wrote:
<br>&gt; Hi all,
<br>&gt;=20
<br>&gt; it&#39;s still basically a PoC, not yet specified and with a lot o=
f sharp
<br>&gt; edges, but it works too well for not being pointed out:
<br>&gt;=20
<br>&gt; The queues/jailhouse-ivshmem2 branch on [1] contains a virtio-ivsh=
mem
<br>&gt; transport driver [2] for Linux front-end guests and a simple virti=
o
<br>&gt; console backend device model [3], also for Linux. Combining that w=
ith
<br>&gt; the wip/ivshmem2 branch of Jailhouse, you can call in the root cel=
l
<br>&gt;=20
<br>&gt; # echo &quot;4a48 4a48 4a48 4a48 ffc003 ffffff&quot; \
<br>&gt; =C2=A0 =C2=A0&gt; /sys/bus/pci/drivers/uio_<wbr>ivshm/new_id
<br>&gt; # virtio-ivshmem-console /dev/uio0
<br>&gt;=20
<br>&gt; and then start the Linux demo inmate which uses &quot;console=3Dhv=
c0&quot;. You will
<br>&gt; both see the (late) boot logs and be able to log into the guest, l=
ike it
<br>&gt; were a serial console. And all that without touching anything in
<br>&gt; Jailhouse (beyond generic ivshmem 2.0 support)!
<br>&gt;=20
<br>&gt; More to come, latest at [4].
<br>&gt;=20
<br>&gt; Jan
<br>&gt;=20
<br>&gt; [1] <a href=3D"http://git.kiszka.org/linux.git/" target=3D"_blank"=
 rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;http://www.google.com/url=
?q\x3dhttp%3A%2F%2Fgit.kiszka.org%2Flinux.git%2F\x26sa\x3dD\x26sntz\x3d1\x2=
6usg\x3dAFQjCNFAZQJ51VxRAdXeRITL3jxxHRC5Sw&#39;;return true;" onclick=3D"th=
is.href=3D&#39;http://www.google.com/url?q\x3dhttp%3A%2F%2Fgit.kiszka.org%2=
Flinux.git%2F\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNFAZQJ51VxRAdXeRITL3jx=
xHRC5Sw&#39;;return true;">http://git.kiszka.org/linux.<wbr>git/</a>
<br>&gt; [2]
<br>&gt; <a href=3D"http://git.kiszka.org/?p=3Dlinux.git;a=3Dblob;f=3Ddrive=
rs/virtio/virtio_ivshmem.c;hb=3Drefs/heads/queues/jailhouse-ivshmem2" targe=
t=3D"_blank" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;http://www.go=
ogle.com/url?q\x3dhttp%3A%2F%2Fgit.kiszka.org%2F%3Fp%3Dlinux.git%3Ba%3Dblob=
%3Bf%3Ddrivers%2Fvirtio%2Fvirtio_ivshmem.c%3Bhb%3Drefs%2Fheads%2Fqueues%2Fj=
ailhouse-ivshmem2\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNGYIdf423Z5dwf9hSJ=
3LVvYC5K8uw&#39;;return true;" onclick=3D"this.href=3D&#39;http://www.googl=
e.com/url?q\x3dhttp%3A%2F%2Fgit.kiszka.org%2F%3Fp%3Dlinux.git%3Ba%3Dblob%3B=
f%3Ddrivers%2Fvirtio%2Fvirtio_ivshmem.c%3Bhb%3Drefs%2Fheads%2Fqueues%2Fjail=
house-ivshmem2\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNGYIdf423Z5dwf9hSJ3LV=
vYC5K8uw&#39;;return true;">http://git.kiszka.org/?p=3D<wbr>linux.git;a=3Db=
lob;f=3Ddrivers/<wbr>virtio/virtio_ivshmem.c;hb=3D<wbr>refs/heads/queues/ja=
ilhouse-<wbr>ivshmem2</a>
<br>&gt; [3]
<br>&gt; <a href=3D"http://git.kiszka.org/?p=3Dlinux.git;a=3Dblob;f=3Dtools=
/virtio/virtio-ivshmem-console.c;hb=3Drefs/heads/queues/jailhouse-ivshmem2"=
 target=3D"_blank" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;http://=
www.google.com/url?q\x3dhttp%3A%2F%2Fgit.kiszka.org%2F%3Fp%3Dlinux.git%3Ba%=
3Dblob%3Bf%3Dtools%2Fvirtio%2Fvirtio-ivshmem-console.c%3Bhb%3Drefs%2Fheads%=
2Fqueues%2Fjailhouse-ivshmem2\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNHfR1y=
8Y8SmKR6Fief2Eunbo5w24w&#39;;return true;" onclick=3D"this.href=3D&#39;http=
://www.google.com/url?q\x3dhttp%3A%2F%2Fgit.kiszka.org%2F%3Fp%3Dlinux.git%3=
Ba%3Dblob%3Bf%3Dtools%2Fvirtio%2Fvirtio-ivshmem-console.c%3Bhb%3Drefs%2Fhea=
ds%2Fqueues%2Fjailhouse-ivshmem2\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNHf=
R1y8Y8SmKR6Fief2Eunbo5w24w&#39;;return true;">http://git.kiszka.org/?p=3D<w=
br>linux.git;a=3Dblob;f=3Dtools/<wbr>virtio/virtio-ivshmem-console.<wbr>c;h=
b=3Drefs/heads/queues/<wbr>jailhouse-ivshmem2</a>
<br>&gt; [4] <a href=3D"https://sched.co/TmxI" target=3D"_blank" rel=3D"nof=
ollow" onmousedown=3D"this.href=3D&#39;https://www.google.com/url?q\x3dhttp=
s%3A%2F%2Fsched.co%2FTmxI\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNHdWzxWB28=
gcQoDjeBuc3ZKyf7xSg&#39;;return true;" onclick=3D"this.href=3D&#39;https://=
www.google.com/url?q\x3dhttps%3A%2F%2Fsched.co%2FTmxI\x26sa\x3dD\x26sntz\x3=
d1\x26usg\x3dAFQjCNHdWzxWB28gcQoDjeBuc3ZKyf7xSg&#39;;return true;">https://=
sched.co/TmxI</a>
<br>&gt;=20
<br>
<br>Was too easy:
<br>
<br>Welcome to Buildroot
<br>jailhouse login: root
<br># mount /dev/vda /mnt/
<br>[ =C2=A0 =C2=A08.968669] EXT4-fs (vda): mounted filesystem with ordered=
 data mode. Opts: (null)
<br># ls -l /mnt/
<br>total 12
<br>drwx------ =C2=A0 =C2=A02 root =C2=A0 =C2=A0 root =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 12288 Oct 14 =C2=A02019 lost+found
<br>
<br>You just need [5] and this to make it happen:
<br>
<br># dd if=3D/dev/zero of=3Ddisk.img bs=3D1M count=3D64
<br># mkfs.ext4 disk.img
<br># echo &quot;4a48 4a48 4a48 4a48 ffc002 ffffff&quot; \
<br>=C2=A0 =C2=A0&gt; /sys/bus/pci/drivers/uio_<wbr>ivshm/new_id
<br># virtio-ivshmem-block /dev/uio0 disk.img
<br>
<br>I&#39;ve updated the Jailhouse wip/ivshmem2 branch with corresponding c=
ell=20
<br>configurations.
<br>
<br>Jan
<br>
<br>[5] <a href=3D"http://git.kiszka.org/?p=3Dlinux.git;a=3Dblob;f=3Dtools/=
virtio/virtio-ivshmem-block.c;hb=3Drefs/heads/queues/jailhouse-ivshmem2" ta=
rget=3D"_blank" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;http://www=
.google.com/url?q\x3dhttp%3A%2F%2Fgit.kiszka.org%2F%3Fp%3Dlinux.git%3Ba%3Db=
lob%3Bf%3Dtools%2Fvirtio%2Fvirtio-ivshmem-block.c%3Bhb%3Drefs%2Fheads%2Fque=
ues%2Fjailhouse-ivshmem2\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNHBGYVYWckl=
1XSYWwI9jcfJYSFKzQ&#39;;return true;" onclick=3D"this.href=3D&#39;http://ww=
w.google.com/url?q\x3dhttp%3A%2F%2Fgit.kiszka.org%2F%3Fp%3Dlinux.git%3Ba%3D=
blob%3Bf%3Dtools%2Fvirtio%2Fvirtio-ivshmem-block.c%3Bhb%3Drefs%2Fheads%2Fqu=
eues%2Fjailhouse-ivshmem2\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNHBGYVYWck=
l1XSYWwI9jcfJYSFKzQ&#39;;return true;">http://git.kiszka.org/?p=3D<wbr>linu=
x.git;a=3Dblob;f=3Dtools/<wbr>virtio/virtio-ivshmem-block.c;<wbr>hb=3Drefs/=
heads/queues/<wbr>jailhouse-ivshmem2</a>
<br>
<br>--=20
<br>Siemens AG, Corporate Technology, CT RDA IOT SES-DE
<br>Corporate Competence Center Embedded Linux
<br></blockquote><div><br></div><div>This will be very handy.</div><div><br=
></div><div>I am current working on project require custom pipes and serial=
 console between cells.</div><div>I have handcrafted the drivers, but if th=
e generic virtio model is adapted, it will be much easier, at least for the=
 Linux side.</div><div><br></div><div>Yang<br></div><div>=C2=A0</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/e67df2f1-0967-453f-97a9-5bc2ea58a790%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/e67df2f1-0967-453f-97a9-5bc2ea58a790%40googlegroups.com<=
/a>.<br />

------=_Part_4323_1176276728.1571189589846--

------=_Part_4322_571277573.1571189589846--
